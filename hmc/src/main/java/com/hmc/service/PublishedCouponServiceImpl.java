package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.PublishedCouponDao;
import com.hmc.vo.Event;
import com.hmc.vo.PublishedCoupon;

@Service
public class PublishedCouponServiceImpl implements PublishedCouponService {
	
	@Autowired
	private PublishedCouponDao publisedCouponDao;

	@Override
	public int getTotalRows(Map<String, Object> param) {
		int rows = publisedCouponDao.getTotalRows(param);
		return rows;
	}

	@Override
	public List<Map<String, Object>> getMyCouponsByUserId(Map<String, Object> param) {
		List<Map<String, Object>> lists = publisedCouponDao.getMyCouponsByUserId(param);
		return lists;
	}

	@Override
	public List<PublishedCoupon> getDateByPublishedCoupon(String couponCode) {
		List<PublishedCoupon> publishedCoupons = publisedCouponDao.getDateByPublishedCoupon(couponCode);
		return publishedCoupons;
	}
	
	
}
