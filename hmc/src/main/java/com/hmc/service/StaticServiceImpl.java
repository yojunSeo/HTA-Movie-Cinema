package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.StaticDao;

@Service
public class StaticServiceImpl implements StaticService {
	
	@Autowired
	private StaticDao staticDao;
	
	@Override
	public List<Map<String, Object>> getBranchBookingRateStatic(String dateString) {
		return staticDao.getBranchBookingRateStatic(dateString);
	}
	
	@Override
	public List<Map<String, Object>> getBranchSalesStatic(String dateString) {
		System.out.println(dateString);
		return staticDao.getBranchSalesStatic(dateString);
	}
	
	@Override
	public List<Map<String, Object>> getUserAgeStatic() {
		return staticDao.getUserAgeStatic();
	}
	
	@Override
	public List<Map<String, Object>> getUserGenderStatic() {
		return staticDao.getUserGenderStatic();
	}

}
