package com.hmc.service;

import java.util.List;

import com.hmc.vo.Inquery;

public interface InqueryService {

	List<Inquery> getAllInquerysByUserId(String userId);

	void insertInquery(Inquery inquery);

	void adminUpdateInquery(Inquery inquery);

}
