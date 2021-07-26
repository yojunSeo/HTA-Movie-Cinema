package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Coupon;
import com.hmc.vo.PublishedCoupon;

public interface PublishedCouponDao {

	void insertPublishedCoupon(PublishedCoupon publishedCoupon);
	
	List<PublishedCoupon> getMyCoupons(String userId);
	
	void updatePublishedCouponStatusToY(String couponCode);
}
