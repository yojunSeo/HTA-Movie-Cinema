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
	
	int getTotalRows(Map<String, Object> param);
	
	int getTotalRowsByEvent(Map<String, Object> param);
	
	int getTotalRowsByPublished(Map<String, Object> param);
	
	int getTotalRowsByNull(Map<String, Object> param);
	
	List<Coupon> couponListPage(Map<String, Object> param);

	List<Coupon> couponListPageByEvent(Map<String, Object> param);
	
	List<Coupon> couponListPageByPublished(Map<String, Object> param);

	List<Coupon> couponListPageByNull(Map<String, Object> param);
	
	List<Coupon> getCouponInfo(Map<String, Object> param);
	
	void modifyCoupon(Coupon coupon);
	
	String getEventCodeByCouponCode(String eventCode);
	
	String existsEventCoupon(String couponCode);

	String existsPublishedCoupon(String couponCode);
}
