package com.hmc.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.service.BookingService;
import com.hmc.service.ScheduleService;

@RestController
@RequestMapping("/booking/book/rest")
public class BookingBookRestController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private BookingService bookingService;
	
	@GetMapping("/seat/info")
	public ResponseEntity<Map<String, Object>> seatInfo(@RequestParam("code") String scheduleCode){
		Map<String, Object> result = scheduleService.getBookedAndRoomSeats(scheduleCode);
		return new ResponseEntity<Map<String, Object>>(result,HttpStatus.OK);
	}

	@GetMapping("/coupon")
	public ResponseEntity<Integer> usedCoupon(@RequestParam("price") String price, 
							@RequestParam("code") String couponCode, @RequestParam("seats") String[] seats ){
		int basePrice = Integer.parseInt(price);
		int discountPrice = 0;
		if(couponCode != null) {
			discountPrice = bookingService.getDiscountPriceByCoupon(basePrice, couponCode, seats);
		}
		return new ResponseEntity<Integer>(discountPrice, HttpStatus.OK);
	}
	
	@GetMapping("/point")
	public ResponseEntity<Map<String, Object>> getUserPointAndExpectGrade(@RequestParam("price") String price){
		int totalPrice = Integer.parseInt(price);
		Map<String, Object> result = bookingService.getUserPointAndExpectGrade(totalPrice);
		return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	}
	
}
