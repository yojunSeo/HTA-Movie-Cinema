package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Coupon;

public interface CouponDao {

	void insertCoupon(Coupon coupon);
	
	List<Coupon> getCouponNonMappingEvent();
	
	Coupon getCouponByCode(String couponCode);
	
	void updateCoupon(Coupon coupon);
	
	void deleteCoupon(String couponCode);
	
}
