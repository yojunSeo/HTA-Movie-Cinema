package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Event;
import com.hmc.vo.PublishedCoupon;

public interface PublishedCouponDao {

	void insertPublishedCoupon(PublishedCoupon publishedCoupon);
	
	List<PublishedCoupon> getMyCoupons(String userId);
	
	void updatePublishedCouponStatusToY(String couponCode);
	
	void updatePublishedCouponStatusToN(String couponCode);
	
	int getTotalRows(Map<String, Object> param);
	
	List<Map<String, Object>> getMyCouponsByUserId(Map<String, Object> param);
	
	void insertPublichedCouponJoin(String couponCode);
	
	void deletePublishedCoupon(String couponCode);
	
	List<String> getDeletePublishedCouponCode(Map<String, Object> param);
	
	String checkPublishedCouponCode(String couponCode);
	
	List<PublishedCoupon> getDateByPublishedCoupon(String couponCode);
}
