package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hmc.dao.PublishedCouponDao;
import com.hmc.vo.PublishedCoupon;

public class publishedCouponServiceImpl implements publishedCouponService {
	
	@Autowired
	private PublishedCouponDao publisedCouponDao;
	

	@Override
	public int getTotalRows(Map<String, Object> param) {
		int rows = publisedCouponDao.getTotalRows(param);
		return rows;
	}


	@Override
	public List<PublishedCoupon> getAllCouponsByUserId(Map<String, Object> param) {
		List<PublishedCoupon> publishedCoupon = publisedCouponDao.getAllCouponsByUserId(param);
		return publishedCoupon;
	}

}
