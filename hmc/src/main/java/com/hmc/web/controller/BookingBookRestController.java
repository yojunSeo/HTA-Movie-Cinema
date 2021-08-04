package com.hmc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.dto.ScheduleDetail;
import com.hmc.service.BookingService;
import com.hmc.service.ScheduleService;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@RestController
@RequestMapping("/booking/book/rest")
public class BookingBookRestController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private BookingService bookingService;
	
	@GetMapping("/seat/info")
	public ResponseEntity<Map<String, Object>> seatInfo(@RequestParam("code") String scheduleCode){
		ScheduleDetail schedule = scheduleService.getScheduleDetail(scheduleCode);
		// 예매불가능한 좌석들을 받아온다
		List<Map<String, Object>> bookedSeats = scheduleService.getBookingSeat(scheduleCode);
		// 스케줄에 해당하는 상영관의 좌석정보를 받아온다.
		List<Map<String, Object>> roomSeats = scheduleService.getRoomSeat(schedule.getRoomCode());
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("bookedSeats", bookedSeats);
		result.put("roomSeats", roomSeats);
		return new ResponseEntity<Map<String, Object>>(result,HttpStatus.OK);
	}

	@GetMapping("/coupon")
	public ResponseEntity<Integer> usedCoupon(@RequestParam("price") String price, 
							@RequestParam("code") String couponCode, @RequestParam("seats") String[] seats ){
		int basePrice = Integer.parseInt(price);
		int discountPrice = 0;
		String type = bookingService.getPublishedCouponType(couponCode);
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
				Map<String, Object> seat = scheduleService.getSeatByCode(seatCode);
				int seatPrice = Integer.parseInt(seat.get("PRICE").toString());
				bestPrice =(bestPrice > seatPrice ? bestPrice : seatPrice);
			}
			discountPrice = bestPrice;
		}
		return new ResponseEntity<Integer>(discountPrice, HttpStatus.OK);
	}
	
	@GetMapping("/point")
	public ResponseEntity<Map<String, Object>> getUserPointAndExpectGrade(@RequestParam("price") String price){
		int totalPrice = Integer.parseInt(price);
		String expectGrade;
		int savePoint = 0;
		Map<String, Object> condition = new HashMap<String, Object>();
		User user = scheduleService.getUserById("lim");
		int totalPayment = bookingService.getUserTotalPayment(user.getId());
		int sumPayment = totalPrice + totalPayment;
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
			savePoint = (int)(totalPrice*(0.01));
		}else if("BRONZE".equals(user.getGrade())) {
			savePoint = (int)(totalPrice*(0.02));
		}else if("SILVER".equals(user.getGrade())) {
			savePoint = (int)(totalPrice*(0.03));
		}else if("GOLD".equals(user.getGrade())) {
			savePoint = (int)(totalPrice*(0.04));
		}else if("PLATINUM".equals(user.getGrade())) {
			savePoint = (int)(totalPrice*(0.05));
		}
		condition.put("expectGrade", expectGrade);
		condition.put("savePoint", savePoint);
		return new ResponseEntity<Map<String, Object>>(condition, HttpStatus.OK);
	}
	
}
