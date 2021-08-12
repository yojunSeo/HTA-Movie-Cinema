package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.InqueryDao;
import com.hmc.vo.Inquery;

@Service
public class InqueryServiceImpl implements InqueryService {
	
	@Autowired
	InqueryDao inqueryDao;

	@Override
	public List<Inquery> getAllInquerysByUserId(Map<String, Object> param) {
		List<Inquery> lists = inqueryDao.getAllInquerysByUserId(param);
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

	@Override
	public List<Inquery> getAllInquerys(Map<String, Object> param) {
		List<Inquery> inquerys = inqueryDao.getAllInquerys(param);
		return inquerys;
	}

	@Override
	public int getTotalRows(Map<String, Object> param) {
		int rows = inqueryDao.getTotalRows(param);
		return rows;
	}

	@Override
	public Inquery getInqueryByCode(String code) {
		Inquery inquery = inqueryDao.getInqueryByCode(code);
		return inquery;
	}

	@Override
	public List<Inquery> getAllInquerysY(Map<String, Object> param) {
		List<Inquery> inquerys = inqueryDao.getAllInquerysY(param);
		return inquerys;
	}

	@Override
	public int getTotalRowsY(Map<String, Object> param) {
		int rows = inqueryDao.getTotalRowsY(param);
		return rows;
	}

	@Override
	public int getTotalRowsByUserId(Map<String, Object> param) {
		int rows = inqueryDao.getTotalRowsByUserId(param);
		return rows;
	}

}
