package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.FacilityDao;
import com.hmc.dto.BranchDetailDto;
import com.hmc.vo.Branch;

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
	public Branch getBranchByCode(String branchCode) {
		
		Branch branch = branchDao.getBranchDetail(branchCode);
		
		return branch;
		
	}
	
	@Override
	public BranchDetailDto getBranchDetailByCode(String branchCode) {
		
		BranchDetailDto branchDto = branchDao.getBranchDetailDto(branchCode);
		return branchDto;
	}
	
	@Override
	public List<Facility> getAllFacility() {
		
		List<Facility> facilities = facilityDao.getAllFacility();
		
		return facilities;
	}

		
	
}
