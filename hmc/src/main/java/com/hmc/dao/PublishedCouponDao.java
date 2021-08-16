package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.PublishedCoupon;

public interface PublishedCouponDao {

	void insertPublishedCoupon(PublishedCoupon publishedCoupon);
	
	List<PublishedCoupon> getMyCoupons(String userId);
	
	void updatePublishedCouponStatusToY(String couponCode);
	
	int getTotalRows(Map<String, Object> param);
	
	List<PublishedCoupon> getAllCouponsByUserId(Map<String, Object> param);
}
