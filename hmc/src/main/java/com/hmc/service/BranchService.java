package com.hmc.service;

import java.util.List;

import com.hmc.dto.BranchDetailDto;
import com.hmc.vo.Branch;
import com.hmc.vo.Facility;

public interface BranchService {
	
	List<Branch> getAllBranch();
	
	BranchDetailDto getBranchDetailByCode(String branchCode);
	
	Branch getBranchByCode(String branchCode);
	
	List<Facility> getAllFacility();
	
	Boolean isFaveriteBranch(String branchCode, String userId);
}
