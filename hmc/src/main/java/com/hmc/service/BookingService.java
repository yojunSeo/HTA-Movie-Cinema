package com.hmc.service;

import java.util.List;
import java.util.Map;

public interface BookingService {

	List<Map<String, Object>> getAbleCouponByUserId(String userId);
	
	String getPublishedCouponType(String publishedId);
	
	int getUserTotalPayment(String userId);
}
