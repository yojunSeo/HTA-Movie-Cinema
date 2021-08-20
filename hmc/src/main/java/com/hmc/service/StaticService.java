package com.hmc.service;

import java.util.List;
import java.util.Map;

public interface StaticService {
	
	List<Map<String, Object>> getUserGenderStatic();
	
	List<Map<String, Object>> getUserAgeStatic();
	
	List<Map<String, Object>> getBranchBookingRateStatic();
	
	List<Map<String, Object>> getBranchSalesStatic(String dateString);

}
