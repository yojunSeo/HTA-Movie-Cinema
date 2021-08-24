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
	
	List<Map<String, Object>> getUserBookingDetail(String userId);
	
	Map<String, Object> getUserBookingPage(int pageNo);
	
	void cancelBooking(String bookingCode);
	
	Map<String, Object> getBookingModalInfo(String scheduleCode, String bookingCode);
	
	Map<String, Object> isUserDownGrade(int beforeTotalPayment, int afterTotalPayment);
	
	void userDownGrade(String grade);
	
	
}
