package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Branch;

public interface BranchDao {

	List<Branch> getAllBranchs();
	
	Branch getBranchDetail(String branchCode);
	
	void updateBranch(Branch branch);
}
