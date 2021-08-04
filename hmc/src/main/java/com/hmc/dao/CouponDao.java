package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Coupon;

public interface CouponDao {

	void insertCoupon(Coupon coupon);
	
	List<Coupon> getCouponNonMappingEvent();
	
	Coupon getCouponByCode(String couponCode);
	
	void updateCoupon(Coupon coupon);
	
	void deleteCoupon(String couponCode);
	
	List<Map<String, Object>> getAbleCouponByUserId(String userId);
	
	Map<String, Object> getPublishedCouponByCode(String publishedId);
	
}
