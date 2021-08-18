package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.PublishedCoupon;

public interface PublishedCouponService {

	int getTotalRows(Map<String, Object> param);
	
	List<Map<String, Object>> getMyCouponsByUserId(Map<String, Object> param);
}
