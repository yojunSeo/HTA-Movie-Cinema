package com.hmc.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.CE_TestService;
import com.hmc.vo.Booking;
import com.hmc.vo.Payment;
import com.hmc.vo.Room;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.Seat;

@Controller
public class TestCE {
	
	private Logger logger = LogManager.getLogger(TestCE.class);
	
	@Autowired
	private CE_TestService service;

	@GetMapping("/testSchedule")
	public String testSchedule(Model model) {
		//logger.info("### 채은 테스트-스케줄등록 페이지 띄우기 ###");
		
		//logger.info("### 스크린 영화목록 가져오기 ###");
		List<ScreenMovie> screenMovies = service.getAllScreenMovies();
		//logger.info(screenMovies);
		model.addAttribute("movies", screenMovies);
		
		//logger.info("### BR000001의 상영관 가져오기 ###");
		List<Room> rooms = service.getBrachRooms("BR000001");
		//logger.info(rooms);
		model.addAttribute("rooms", rooms);
		
		//logger.info("### 모든 상영정보 ###");
		List<Map<String, Object>> schedules = service.getAllSchedule();
		//logger.info(schedules);
		model.addAttribute("schedules", schedules);

		return "test/schedule";
	}
	
	@PostMapping("/testSchedule")
	public String insertSchedule(String screenCode, String branchCode, String roomCode,
								String scheduleDate, String startTime) throws ParseException {
		//System.out.println("--------------submit---");
		//System.out.println(screenCode);
		//System.out.println(branchCode);
		//System.out.println(roomCode);
		//System.out.println(scheduleDate);
		//.out.println(startTime);
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
		SimpleDateFormat format3 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date scheduleDate1 = format1.parse(scheduleDate);
		Date startTime1 = format2.parse(startTime);
		String startTime2 = format3.format(startTime1);
		//System.out.println(scheduleDate1);
		//System.out.println(startTime1);
		//System.out.println(startTime2);
		
		ScreenMovie movie = service.getScreenMovieByCode(screenCode);
		//System.out.println(movie);
		int runningTime = movie.getRunningTime();
		//System.out.println(runningTime);
		Schedule schedule = new Schedule();
		schedule.setScreenCode(screenCode);
		schedule.setBranchCode("BR000001");
		schedule.setRoomCode(roomCode);
		schedule.setScheduleDate(scheduleDate1);
		schedule.setStartTime(startTime1);
		
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("startTime", startTime2);
		condition.put("runningTime", runningTime);
		
		Date endTime = service.getEndTime(condition);
		//System.out.println(endTime);
		
		schedule.setEndTime(endTime);
		service.createSchedule(schedule);
		
		return "redirect:testSchedule";
	}
	
	@GetMapping("/testBookingHome")
	public String testBookingHome(Model model) {
		//logger.info("### 채은 테스트-예매 페이지 띄우기 ###");
		
		//logger.info("### 모든 상영정보 ###");
		List<Map<String, Object>> schedules = service.getAllSchedule();
		//logger.info(schedules);
		model.addAttribute("schedules", schedules);
		
		logger.info("### 내 예매내역 ###");
		List<Map<String, Object>> bookings = service.getMyBookingList("chaen");
		logger.info(bookings);
		model.addAttribute("bookings", bookings );
		
		return "test/bookinghome";
	}
	
	@GetMapping("/testBooking")
	public String testBooking(@RequestParam("scheduleCode") String scheduleCode, Model model) {
		Map<String, Object> schedule = service.getScheduleByCode(scheduleCode);
		//System.out.println(schedule);
		
		Map<String, Object> seatCondition = new HashMap<String, Object>();
		//System.out.println(schedule.get("BRANCHCODE"));
		//System.out.println(schedule.get("ROOMCODE"));
		
		seatCondition.put("branchCode", schedule.get("BRANCHCODE"));
		seatCondition.put("roomCode", schedule.get("ROOMCODE"));
		
		List<Seat> seats = service.getSeats(seatCondition);
		//System.out.println(seats);
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("seats", seats);
		
		return "test/booking";
	}
	
	@PostMapping("/testBooking")
	public String insertBooking(String seatCode, String paymentWay,@RequestParam("schduleCode") String scheduleCode) {
		System.out.println(seatCode);
		System.out.println(paymentWay);
		System.out.println(scheduleCode);
		
		Map<String, Object> seat = service.getSeatByCode(seatCode);
		System.out.println(seat.get("PRICE").toString());
		int price = Integer.parseInt(seat.get("PRICE").toString());
		System.out.println(price);
		
		Payment payment = new Payment();
		payment.setUserId("chaen");
		payment.setPrice(price);
		payment.setWay(paymentWay);
		
		service.insertPayment(payment);
		System.out.println(payment.getCode());
		
		Booking booking = new Booking();
		booking.setCount(1);
		booking.setPaymentCode(payment.getCode());
		booking.setPrice(price);
		booking.setScheduleCode(scheduleCode);
		booking.setTotalPrice(price);
		booking.setUserId("chaen");
		
		service.insertBooking(booking);
		
		return "redirect:testBookingHome";
	}
}
