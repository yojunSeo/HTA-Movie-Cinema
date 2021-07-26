package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Inquery;

public interface InqueryDao {
	
	List<Inquery> getAllInquerysByUserId(String userId);
	
	void insertInquery(Inquery inquery);
	
	void adminUpdateInquery(Inquery inquery);
	
	
	

}
