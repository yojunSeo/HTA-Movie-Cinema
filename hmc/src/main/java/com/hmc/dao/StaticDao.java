package com.hmc.dao;

import java.util.List;
import java.util.Map;

public interface StaticDao {

	List<Map<String, Object>> getUserGenderStatic();
	
	List<Map<String, Object>> getUserAgeStatic();
	
	List<Map<String, Object>> getBranchBookingRateStatic();
	
	List<Map<String, Object>> getBranchSalesStatic(String dateString);
}
