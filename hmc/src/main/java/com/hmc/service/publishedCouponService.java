package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.PublishedCoupon;

public interface publishedCouponService {
	
	int getTotalRows(Map<String, Object> param);
	
	List<PublishedCoupon> getAllCouponsByUserId(Map<String, Object> param);

}
