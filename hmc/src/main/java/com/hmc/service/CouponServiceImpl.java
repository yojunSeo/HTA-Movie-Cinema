package com.hmc.service;

import java.lang.module.FindException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.CouponCategoryDao;
import com.hmc.dao.CouponDao;
import com.hmc.dao.PublishedCouponDao;
import com.hmc.vo.Coupon;
import com.hmc.vo.PublishedCoupon;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	CouponDao couponDao;
	
	@Autowired
	CouponCategoryDao couponCategoryDao;
		
	@Autowired
	PublishedCouponDao publishedCouponDao;
	
	@Override
	public List<Coupon> couponListPage(Map<String, Object> param) {
		List<Coupon> coupons = couponDao.couponListPage(param);
		return coupons;
	}
	
	@Override
	public void deleteCoupon(String couponCode) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Map<String, Object>> getAbleCouponByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Coupon getCouponByCode(String couponCode) {
		Coupon coupon = couponDao.getCouponByCode(couponCode);
		return coupon;
	}
	
	@Override
	public List<Coupon> getCouponNonMappingEvent() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Map<String, Object> getPublishedCouponByCode(String publishedId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getTotalRows(Map<String, Object> param) {
		int rows = couponDao.getTotalRows(param);
		return rows;
	}
	
	@Override
	public void insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void updateCoupon(Coupon coupon) {
		couponDao.updateCoupon(coupon);
	}
	
	@Override
	public Coupon getCouponDetail(String couponCode) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Coupon> getCouponInfo(Map<String, Object> param) {
		List<Coupon> coupons = couponDao.getCouponInfo(param);
		return coupons;
	}
	
	
	
	
	
}
