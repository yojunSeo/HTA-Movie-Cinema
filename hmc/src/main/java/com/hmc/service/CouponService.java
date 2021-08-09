package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Coupon;

public interface CouponService {

	public void couponServiceTest();
	
	public void publishedCouponServiceTest();
	
	void insertCoupon(Coupon coupon);
	
	List<Coupon> getCouponNonMappingEvent();
	
	Coupon getCouponByCode(String couponCode);
	
	void updateCoupon(Coupon coupon);
	
	void deleteCoupon(String couponCode);
	
	List<Map<String, Object>> getAbleCouponByUserId(String userId);
	
	Map<String, Object> getPublishedCouponByCode(String publishedId);
	
	int getTotalRows(Map<String, Object> param);
	
	List<Coupon> couponListPage(Map<String, Object> param);
	
	Coupon getCouponDetail(String couponCode);
	
}
