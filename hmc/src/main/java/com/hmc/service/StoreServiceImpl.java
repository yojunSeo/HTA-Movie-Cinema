package com.hmc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmc.dao.CouponDao;
import com.hmc.dao.GiftProductDao;
import com.hmc.dao.PaymentDao;
import com.hmc.dao.ProductCategoryDao;
import com.hmc.dao.ProductDao;
import com.hmc.dao.PublishedCouponDao;
import com.hmc.dao.UserDao;
import com.hmc.dto.Membership;
import com.hmc.vo.GiftProduct;
import com.hmc.vo.Pagination;
import com.hmc.vo.Payment;
import com.hmc.dao.ProductDao;

import com.hmc.dao.ProductDao;
import com.hmc.vo.Product;
import com.hmc.vo.PublishedCoupon;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Service
@Transactional
public class StoreServiceImpl implements StoreService{

	@Autowired
	private ProductDao productDao;

	@Autowired
	private ProductCategoryDao productCategoryDao;
	
	@Autowired
	private GiftProductDao giftProductDao;
	
	@Autowired
	private PaymentDao paymentDao;
	
	@Autowired
	private UserDao userDao;
	
	@Resource(name = "membershipMap")
	private Map<String, Membership> membershipMap;
	
	@Autowired
	private PublishedCouponDao publishedCouponDao;
	
	private static final int ROWS_PER_PAGE = 7;
	private static final int PAGE_PER_PAGE_BLOCK = 5;
	
	@Override
	public void insertProduct(Product product) {
		
		productDao.insertProduct(product);
		
	}
	
	@Override
	public List<String> getAllProductCategory() {
		
		return productCategoryDao.getAllProductCategory();
	}
	
	@Override
	public List<Product> getAllProduct() {
		return productDao.getAllProduct();
	}
	
	@Override
	public int getTotalProductsRows() {
		return productDao.getTotalProductsRows();
	}

	@Override
	public List<Product> getProductPagination(Map<String, Object> pageInfo) {
		return productDao.getProductByIndex(pageInfo);
	}
	
	@Override
	public Product getProductByCode(String productCode) {
		return productDao.getProductByCode(productCode);
	}
	
	
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}
	
	@Override
	public void deleteProductByCode(String productCode) {
		productDao.deleteProductByCode(productCode);
		
	}
	
	/**
	 * 결제 완료 처리 후 PAYMENT 테이블에 정보를 저장하는 메서드
	 * 선물하기 처리 후 GIFT_PRODUCT 테이블에 정보를 저장하는 메소드
	 * 유저의 등급과 포인트를 갱신해주는 메서드 
	 */
	@Override
	public void successPayment(Map<String, Object> paymentInfo) {
		
		Payment payment = (Payment) paymentInfo.get("payment");
		paymentDao.insertPayment(payment);
		
		GiftProduct giftProduct = (GiftProduct) paymentInfo.get("giftProduct");
		giftProduct.setPaymentCode(payment.getCode());
		int amount = giftProduct.getAmount();
		giftProduct.setAmount(1);
		
		for(int i=1; i<=amount; i++) {
			giftProductDao.insertGiftProduct(giftProduct);
		}
		
		
		// 등급 업그레이드 판별
		// 결제 전과 결제 후의 결제총액으로 해당하는 등급을 산출한 후 서로 비교하여 변동여부를 판별
		User user = userDao.getUserById(payment.getUserId());
		String beforeGrade = user.getGrade();
		String afterGrade;
		String userId = payment.getUserId();
		int yearTotalPayment = paymentDao.getUserTotalPayment(userId);
		
		if(yearTotalPayment >= 1000000) {
			afterGrade = "PLATINUM";
		} else if(yearTotalPayment >= 700000) {
			afterGrade = "GOLD";
		} else if(yearTotalPayment >= 400000) {
			afterGrade = "SILVER";
		} else if(yearTotalPayment >= 200000) {
			afterGrade = "BRONZE";
		} else {
			afterGrade = "NORMAL";
		}
		
		
		// 등급이 업그레이드 될 경우
		if(!beforeGrade.equals(afterGrade)) {
			Membership afterMemberShip = membershipMap.get(afterGrade);

			// 포인트 지급 처리
			System.out.println(afterGrade);
			System.out.println(afterMemberShip.getSavedPoint());
			user.setPoint(user.getPoint() + afterMemberShip.getSavedPoint());
			
			
			// 5000원 쿠폰 지급 처리
			PublishedCoupon coupon5000 = new PublishedCoupon();
			coupon5000.setCouponCode(afterMemberShip.getCp5000());
			coupon5000.setUserId(user.getId());
			for(int i=1; i<=afterMemberShip.getCp5000Repeat(); i++) {
				publishedCouponDao.insertPublishedCoupon(coupon5000);
			}
			
			// 영화관람권 쿠폰 지급 처리
			PublishedCoupon couponMovie = new PublishedCoupon();
			couponMovie.setCouponCode(afterMemberShip.getCpMovie());
			couponMovie.setUserId(user.getId());
			for(int i=1; i<=afterMemberShip.getCpMovieRepeat(); i++) {
				publishedCouponDao.insertPublishedCoupon(couponMovie);
			}
			
			user.setGrade(afterGrade);
		}
		
		
		// 사용한 포인트 차감 처리
		// 결제금액의 등급별 비율만큼 포인트 증가 처리
		Membership beforeMembership = membershipMap.get(beforeGrade);
		System.out.println(beforeGrade);
		System.out.println(beforeMembership);
		System.out.println(afterGrade);
		int point = user.getPoint() + (int)(payment.getPrice()*beforeMembership.getSavedRate()) - (int)paymentInfo.get("usedPoint");
		user.setPoint(point);
		
		userDao.updateUser(user);
		
	}
	
	@Override
	public Map<String, Object> getUserPaymentGifts(int pageNo) {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		// 내가 산거
		Map<String, Object> paymentParam = new HashMap<String, Object>();
		paymentParam.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		paymentParam.put("endIndex", pageNo*ROWS_PER_PAGE);
		paymentParam.put("userId", user.getId());
		List<Map<String, Object>> payments = giftProductDao.getMyPaymentGift(paymentParam);
		
		int totalRows1 = giftProductDao.getMyPaymentGiftCnt(user.getId());
		int totalPages1 = (int)Math.ceil((double)totalRows1/ROWS_PER_PAGE);
		int totalBlocks1 = (int)Math.ceil((double)totalPages1/PAGE_PER_PAGE_BLOCK);
		int currentBlock1 = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		int beginPage1 = (currentBlock1-1)*PAGE_PER_PAGE_BLOCK + 1;
		int endPage1 = currentBlock1*PAGE_PER_PAGE_BLOCK;
		if(currentBlock1 == totalBlocks1) {
			endPage1 = totalPages1;
		}
		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage1);
		pagination.setCurrentPageBlock(currentBlock1);
		pagination.setEndPage(endPage1);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks1);
		pagination.setTotalPages(totalPages1);
		pagination.setTotalRows(totalRows1);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("payments", payments);
		result.put("pagination", pagination);
		return result;
	}
	
	@Override
	public Map<String, Object> getUserReceiveGifts(int pageNo) {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		// 내가 받은거
		Map<String, Object> receiveParam = new HashMap<String, Object>();
		receiveParam.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		receiveParam.put("endIndex", pageNo*ROWS_PER_PAGE);
		receiveParam.put("userId", user.getId());
		List<Map<String, Object>> receives = giftProductDao.getMyReceiveGift(receiveParam);
		
		int totalRows2 = giftProductDao.getMyPaymentGiftCnt(user.getId());
		int totalPages2 = (int)Math.ceil((double)totalRows2/ROWS_PER_PAGE);
		int totalBlocks2 = (int)Math.ceil((double)totalPages2/PAGE_PER_PAGE_BLOCK);
		int currentBlock2 = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		int beginPage2 = (currentBlock2-1)*PAGE_PER_PAGE_BLOCK + 1;
		int endPage2 = currentBlock2*PAGE_PER_PAGE_BLOCK;
		if(currentBlock2 == totalBlocks2) {
			endPage2 = totalPages2;
		}
		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage2);
		pagination.setCurrentPageBlock(currentBlock2);
		pagination.setEndPage(endPage2);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks2);
		pagination.setTotalPages(totalPages2);
		pagination.setTotalRows(totalRows2);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("receives", receives);
		result.put("pagination", pagination);
		return result;
	}
	

}
