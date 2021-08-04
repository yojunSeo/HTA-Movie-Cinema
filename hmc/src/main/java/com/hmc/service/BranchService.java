package com.hmc.service;

import java.util.List;

import com.hmc.vo.Branch;

public interface BranchService {
	
	List<Branch> getAllBranch();
	
	
	Branch getBranchDetailByCode(String branchCode);
	
}
