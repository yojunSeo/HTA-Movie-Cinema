package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.InqueryDao;
import com.hmc.vo.Inquery;

@Service
public class InqueryServiceImpl implements InqueryService {
	
	@Autowired
	InqueryDao inqueryDao;

	@Override
	public List<Inquery> getAllInquerysByUserId(String userId) {
		List<Inquery> lists = inqueryDao.getAllInquerysByUserId(userId);
		return lists;
	}

	@Override
	public void insertInquery(Inquery inquery) {
		inqueryDao.insertInquery(inquery);
		
	}

	@Override
	public void adminUpdateInquery(Inquery inquery) {
		inqueryDao.adminUpdateInquery(inquery);
		
	}

}
