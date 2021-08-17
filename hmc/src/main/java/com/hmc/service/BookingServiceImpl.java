package com.hmc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmc.dao.BookingDao;
import com.hmc.dao.CouponDao;
import com.hmc.dao.PaymentDao;
import com.hmc.dao.PublishedCouponDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.SeatDao;
import com.hmc.dao.UserDao;
import com.hmc.dto.BookingDto;
import com.hmc.dto.Membership;
import com.hmc.vo.Booking;
import com.hmc.vo.Pagination;
import com.hmc.vo.Payment;
import com.hmc.vo.PublishedCoupon;
import com.hmc.vo.Schedule;
import com.hmc.vo.SeatBooking;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Transactional
@Service
public class BookingServiceImpl implements BookingService{
	
	private static final int ROWS_PER_PAGE = 7;
	private static final int PAGE_PER_PAGE_BLOCK = 5;
	
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private SeatDao seatDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private BookingDao bookingDao;
	@Autowired
	private PublishedCouponDao publishedCouponDao;
	@Resource(name = "membershipMap")
	private Map<String, Membership> membershipMap;
	
	@Override
	public Map<String, Object> getUserBookingPage(int pageNo) {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		param.put("userId", user.getId());
		List<Map<String, Object>> bookings = bookingDao.getBookingPageByUser(param);
		
		// 페이징 처리
		// 총 행의 갯수 구하기
		int totalRows = bookingDao.getBookingCntByUserId(user.getId());
		// 총 페이지 갯수 구하기
		int totalPages = (int)Math.ceil((double)totalRows/ROWS_PER_PAGE);
		// 총 페이지 블록갯수 
		int totalBlocks = (int)Math.ceil((double)totalPages/PAGE_PER_PAGE_BLOCK);
		// 요청한 페이지번호가 속하는 페이지 블록 계산
		int currentBlock = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		// 현재 페이지 블록의 시작과 끝 페이지 번호계산
		int beginPage = (currentBlock-1)*PAGE_PER_PAGE_BLOCK + 1;
		int endPage = currentBlock*PAGE_PER_PAGE_BLOCK;
		if(currentBlock == totalBlocks) {
			endPage = totalPages;
		}
		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage);
		pagination.setCurrentPageBlock(currentBlock);
		pagination.setEndPage(endPage);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks);
		pagination.setTotalPages(totalPages);
		pagination.setTotalRows(totalRows);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("bookings", bookings);
		result.put("pagination", pagination);
		
		return result;
	}

	@Override
	public List<Map<String, Object>> getAbleCouponByUserId(String userId) {
		return couponDao.getAbleCouponByUserId(userId);
	}

	@Override
	public String getPublishedCouponType(String publishedId) {
		Map<String, Object> coupon = couponDao.getPublishedCouponByCode(publishedId);
		if(coupon != null) {
			String type = coupon.get("TYPE").toString();
			return type;
		}
		return null;
	}
	
	@Override
	public void insertGradeCouponAndPoint(String grade, User user) {
		PublishedCoupon cp5000 = new PublishedCoupon();
		cp5000.setUserId(user.getId());
		PublishedCoupon cpMoive = new PublishedCoupon();
		cpMoive.setUserId(user.getId());
		
		Membership membership = membershipMap.get(grade);
		int cp5000Repeat = membership.getCp5000Repeat();
		int cpMoiveRepeat = membership.getCpMovieRepeat();
		
		cp5000.setCouponCode(membership.getCp5000());
		cpMoive.setCouponCode(membership.getCpMovie());
		user.setPoint(user.getPoint()+membership.getSavedPoint());
		
		// 5000원 쿠폰 넣기
		for(int i=0; i<cp5000Repeat; i++) {
			publishedCouponDao.insertPublishedCoupon(cp5000);
		}
		// 영화관람권 쿠폰 넣기
		for(int i=0; i<cpMoiveRepeat; i++) {
			publishedCouponDao.insertPublishedCoupon(cpMoive);
		}
	}
	
	@Override
	public Map<String, Object> successBooking(BookingDto book) {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		// Payment 생성 후 인서트
		Payment payment = new Payment();
		payment.setUserId(user.getId());
		payment.setPrice(book.getTotalPrice());
		payment.setWay("카카오페이");
		paymentDao.insertPayment(payment);
		String paymentCode = payment.getCode();
				
		// Booking 생성 후 인서트
		Booking booking = new Booking();
		booking.setScheduleCode(book.getScheduleCode());
		booking.setUserId(user.getId());
		booking.setPaymentCode(paymentCode);
		booking.setCount(book.getSeatCode().length);
		booking.setPrice(book.getBasePrice());
		booking.setDiscountPrice(book.getDisCountPrice());
		booking.setTotalPrice(book.getTotalPrice());
		bookingDao.insertBooking(booking);
		String bookingCode = booking.getCode();
		
		List<String> seatName = new ArrayList<String>();
		// SeatBooking 생성 후 인서트
		for(String seatCode : book.getSeatCode()) {
			SeatBooking sb = new SeatBooking();
			sb.setBookingCode(bookingCode);
			sb.setScheduleCode(book.getScheduleCode());
			sb.setSeatCode(seatCode);
			Map<String, Object> seat = seatDao.getSeatByCode(seatCode);
			seatName.add(seat.get("SEATROW").toString() +seat.get("SEATCOL").toString());
			seatDao.insertSeatBooking(sb);
		}
		// 쿠폰 사용했으면 사용 상태 변경
		if(book.getUsedCoupon() != null) {
			publishedCouponDao.updatePublishedCouponStatusToY(book.getUsedCoupon());
		}
		// 포인트 사용한만큼 사용자포인트에서 차감 // 적립예정포인트 적립하기
		user.setPoint(user.getPoint() - book.getUsedPoint() + book.getSavedPoint());
		// 만약 사용자의 현재등급이랑 예상등급이 다르다면!
		if(!book.getExceptGrade().equals(user.getGrade())) {
			insertGradeCouponAndPoint(book.getExceptGrade(), user);
			user.setGrade(book.getExceptGrade());
		}
		userDao.updateUser(user);
		// 스케줄의 남은예매인원 바꾸기
		Schedule schedule = scheduleDao.getScheduleByCode(book.getScheduleCode());
		schedule.setEmptySeat(schedule.getEmptySeat() - book.getSeatCode().length);
		scheduleDao.updateSchedule(schedule);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("booking", booking);
		result.put("schedule", scheduleDao.getScheduleDetailByCode(book.getScheduleCode()));
		result.put("seats", seatName);
		return result;
	}
	
	@Override
	public int getDiscountPriceByCoupon(int basePrice, String couponCode, String[] seats) {
		int discountPrice = 0;
		if(couponCode != null) {
			String type = getPublishedCouponType(couponCode);
			if("50%할인".equals(type)) {
				discountPrice = (int)(basePrice*(0.5));
			}else if("30%할인".equals(type)) {
				discountPrice = (int)(basePrice*(0.3));
			}else if("5000원 할인".equals(type)) {
				discountPrice = 5000;
			}else if("영화관람권".equals(type)) {
				// 좌석의 가격을 조회해서 가장 비싼 좌석의 가격으로 산정한다.
				int bestPrice = 0;
				for(String seatCode : seats) {
					Map<String, Object> seat = seatDao.getSeatByCode(seatCode);
					int seatPrice = Integer.parseInt(seat.get("PRICE").toString());
					bestPrice =(bestPrice > seatPrice ? bestPrice : seatPrice);
				}
				discountPrice = bestPrice;
			}
		}
		return discountPrice;
	}
	
	@Override
	public Map<String, Object> getUserPointAndExpectGrade(int paymentPrice) {
		String expectGrade;
		int savePoint = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		int totalPayment = paymentDao.getUserTotalPayment(user.getId());
		int sumPayment = paymentPrice + totalPayment;
		System.out.println(sumPayment);
		String gradeColor = "bg-dark";
		if(sumPayment >= 200000 && sumPayment < 400000) {
			expectGrade = "BRONZE";
			gradeColor = "bg-success";
		}else if(sumPayment >= 400000 && sumPayment < 700000) {
			expectGrade = "SILVER";
			gradeColor = "bg-secondary";
		}else if(sumPayment >= 700000 && sumPayment < 1000000) {
			expectGrade = "GOLD";
			gradeColor = "bg-warning";
		}else if(sumPayment >= 1000000) {
			expectGrade = "PLATINUM";
			gradeColor = "bg-primary";
		}else {
			expectGrade = "NORMAL";
		}
		if("NORMAL".equals(user.getGrade())) {
			savePoint = (int)(paymentPrice*(0.01));
		}else {
			Membership membership = membershipMap.get(user.getGrade());
			savePoint = (int)(paymentPrice*membership.getSavedRate());
		}
		result.put("expectGrade", expectGrade);
		result.put("savePoint", savePoint);
		result.put("gradeColor", gradeColor);
		System.out.println(result);
		return result;
	}
	
	@Override
	public Map<String, Object> getCancelBookingUserPointAndExpectGrade(int paymentPrice) {
		String expectGrade;
		int savePoint = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		int totalPayment = paymentDao.getUserTotalPayment(user.getId());
		int sumPayment = paymentPrice - totalPayment;
		if(sumPayment >= 200000) {
			expectGrade = "BRONZE";
		}else if(sumPayment >= 400000) {
			expectGrade = "SILVER";
		}else if(sumPayment >= 700000) {
			expectGrade = "GOLD";
		}else if(sumPayment >= 1000000) {
			expectGrade = "PLATINUM";
		}else {
			expectGrade = "NORMAL";
		}
		if("NORMAL".equals(user.getGrade())) {
			savePoint = (int)(paymentPrice*(0.01));
		}else {
			Membership membership = membershipMap.get(user.getGrade());
			savePoint = (int)(paymentPrice*membership.getSavedRate());
		}
		
		result.put("expectGrade", expectGrade);
		result.put("savePoint", savePoint);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> getUserBookingDetail(String userId) {
		return bookingDao.getBookingDetailsByUserId(userId);
	}
	
	@Override
	public void cancelBooking(String bookingCode) {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		int totalPayment1 = paymentDao.getUserTotalPayment(user.getId());
		System.out.println(totalPayment1);
		// seatBooking삭제 payment status 변경 bookingStatus변경 등급변경확인 schedule emptyseat
		Booking cancelBook = bookingDao.getBookingByCode(bookingCode);
		// 예매한 좌석 삭제
		seatDao.deleteSeatBooking(bookingCode);
		// 결제 상태 변경
		paymentDao.updatePaymentStatus(cancelBook.getPaymentCode());
		// 예매상태 변경
		bookingDao.updateBookingStatus(bookingCode);
		// 스케줄 totalseat변경
		Schedule schedule = scheduleDao.getScheduleByCode(cancelBook.getScheduleCode());
		schedule.setEmptySeat(schedule.getEmptySeat() + cancelBook.getCount());
		scheduleDao.updateSchedule(schedule);
		// 적립된 포인트만큼 삭제하기
		Map<String, Object> result = getCancelBookingUserPointAndExpectGrade(cancelBook.getTotalPrice());
		int minusPoint = Integer.parseInt(result.get("savePoint").toString());
		user.setPoint(user.getPoint() - minusPoint);
		System.out.println(minusPoint);
		String expectGrade = result.get("expectGrade").toString();
		System.out.println(expectGrade);
		// 등급이 변경되었는지 확인
		if(!user.getGrade().equals(expectGrade)) {
			System.out.println("변경됨");
			// 준 쿠폰과 포인트 가져가기
		}
		userDao.updateUser(user);
	}

}
