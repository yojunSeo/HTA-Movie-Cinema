package com.hmc.dao;

import java.util.List;

import com.hmc.dto.BranchDetailDto;
import com.hmc.vo.Branch;

public interface BranchDao {

	List<Branch> getAllBranchs();
	
	List<Branch> getAllActiveBranchs();
	
	Branch getBranchDetail(String branchCode);
	
	BranchDetailDto getBranchDetailDto(String branchCode);
	
	void updateBranch(Branch branch);
	
	String getBranchNameByCode(String branchCode);
}
