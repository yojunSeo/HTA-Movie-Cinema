package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.dto.BookingDto;
import com.hmc.vo.User;

public interface BookingService {

	List<Map<String, Object>> getAbleCouponByUserId(String userId);
	
	String getPublishedCouponType(String publishedId);
	
	void insertGradeCouponAndPoint(String grade, User user);
	
	Map<String, Object> successBooking(BookingDto book);
	
	int getDiscountPriceByCoupon(int basePrice, String couponCode, String[] seats);
	
	Map<String, Object> getUserPointAndExpectGrade(int paymentPrice);
	
}
