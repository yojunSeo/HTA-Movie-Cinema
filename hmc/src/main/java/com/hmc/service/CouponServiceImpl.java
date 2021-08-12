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
	
	@Override
	public void couponServiceTest() {
		
		Coupon coupon = new Coupon();
		Coupon coupon2 = new Coupon();
		
		coupon.setName("영화보고 리뷰쓰자 쿠폰");
		coupon.setType("할인");
		
		coupon2.setName("설문조사 참여 쿠폰");
		coupon2.setType("관람권");
		
		//couponDao.insertCoupon(coupon);
		//couponDao.insertCoupon(coupon2);
		
		List<Coupon> couponList = couponDao.getCouponNonMappingEvent();
		for(Coupon coup : couponList) {
			System.out.println(coup);
		}
		
		Coupon findedCoupon = couponDao.getCouponByCode("CP000047");
		System.out.println(findedCoupon);
		
		findedCoupon.setEventCode("EV000021");
		
		//couponDao.updateCoupon(findedCoupon);
		
		//couponDao.deleteCoupon("CP000048");
		
		List<String> couponCates = couponCategoryDao.getAllCouponCategorys();
		
		for(String cps : couponCates) {
			System.out.println(cps);
		}
		
	}
	
	@Autowired
	PublishedCouponDao publishedCouponDao;
	
	@Override
	public void publishedCouponServiceTest() {
		
		String[] userIds = {"hong", "kim", "lee"};
		/*
		for(String userid : userIds) {
			PublishedCoupon pc = new PublishedCoupon();			
			pc.setCouponCode("CP000001");
			pc.setUserId(userid);
			
			publishedCouponDao.insertPublishedCoupon(pc);
		}
		*/
		List<PublishedCoupon> myCoupons = publishedCouponDao.getMyCoupons("hong");
		
		for(PublishedCoupon pc : myCoupons) {
			System.out.println(pc);
		}
		
		publishedCouponDao.updatePublishedCouponStatusToY("PC000027");
	}
	
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
		// TODO Auto-generated method stub
		
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
