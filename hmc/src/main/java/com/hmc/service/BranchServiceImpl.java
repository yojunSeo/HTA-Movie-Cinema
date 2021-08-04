package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void branchServiceTest() {
		List<Branch> branchList = branchDao.getAllBranchs();
		
		for(Branch branch : branchList) {
			System.out.println(branch);
		}
		
		Branch branch2 = branchDao.getBranchDetail("BR000024");
		System.out.println("branchinfo : " + branch2);
		
		branch2.setStatus("N");
		branch2.setParking_info("지하 2~3층 주차장은 HMC사당점의 전용 주차장입니다. 영화 관람 후 반드시 주차권을 데스크에서 받아가시길 바랍니다.");
		
		//branchDao.updateBranch(branch2);
		
		List<Facility> facs = facilityDao.getAllFacility();
		for(Facility fac : facs) {
			System.out.println(fac);
		}
	}

	@Override
	public List<Branch> getAllBranchs() {
		List<Branch> branchs = branchDao.getAllBranchs();
		return branchs;
	}
}
