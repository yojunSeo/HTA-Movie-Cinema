package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.FacilityDao;
import com.hmc.dao.UserDao;
import com.hmc.dto.BranchDetailDto;
import com.hmc.vo.Branch;
import com.hmc.vo.Facility;
import com.hmc.vo.User;

@Service
public class BranchServiceImpl implements BranchService{

	@Autowired
	BranchDao branchDao;
	
	@Autowired
	FacilityDao facilityDao;
	
	@Autowired
	UserDao userDao;
	
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
	
	// 해당 지점이 나의 지점인지 체크해주는 매서드
	@Override
	public Boolean isFaveriteBranch(String branchCode, String userId) {
		
		User loginedUser = userDao.getUserById(userId);
		
		boolean isFaverite = false;
		
		if(loginedUser.getFavoriteBranch1().equals(branchCode)) {
			isFaverite = true;
		} else if(loginedUser.getFavoriteBranch2().equals(branchCode)) {
			isFaverite = true;			
		} else if(loginedUser.getFavoriteBranch3().equals(branchCode)) {
			isFaverite = true;
		}
		
		return isFaverite;
	}

		
	
}
