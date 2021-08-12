package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Inquery;

public interface InqueryService {

	List<Inquery> getAllInquerysByUserId(Map<String, Object> param);
	
	int getTotalRowsByUserId(Map<String, Object> param);

	void insertInquery(Inquery inquery);

	void adminUpdateInquery(Inquery inquery);
	
	List<Inquery> getAllInquerys(Map<String, Object> param);
	
	int getTotalRows(Map<String, Object> param);
	
	List<Inquery> getAllInquerysY(Map<String, Object> param);
	
	int getTotalRowsY(Map<String, Object> param);
	
	Inquery getInqueryByCode(String code);

}
