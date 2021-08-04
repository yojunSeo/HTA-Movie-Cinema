package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.dao.BranchDao;
import com.hmc.dao.FacilityDao;
import com.hmc.vo.Branch;
import com.hmc.vo.Facility;

@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	BranchDao branchDao;
	
	@Autowired
	FacilityDao facilityDao;
	
	@Override
	public List<Branch> getAllBranch() {
		
		List<Branch> branchs = branchDao.getAllActiveBranchs();
		
		return branchs;
	}
	
	@Override
	public Branch getBranchDetailByCode(String branchCode) {
		
		Branch branch = branchDao.getBranchDetail(branchCode);
		
		return branch;
		
	}
	

		
	
}
