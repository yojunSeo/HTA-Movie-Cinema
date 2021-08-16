package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.BranchService;
import com.hmc.vo.Branch;
import com.hmc.vo.Facility;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;

@Controller
@RequestMapping("/admin/branch")
public class AdminBranchController {

	@Autowired
	private BranchService branchService;
	
	@RequestMapping("home") 
	public String home (@LoginAdmin User loginAdmin, Model model) {
		
		List<Branch> branchList = branchService.getAllBranch();
		model.addAttribute("branchList", branchList);
		
		return "admin/branch/home";
	}
	
	@RequestMapping("detail")
	public String detail (@LoginAdmin User loginAdmin, @RequestParam("branchCode") String branchCode, Model model) {
		
		Branch branch = branchService.getBranchByCode(branchCode);
		List<Facility> facilityList = branchService.getAllFacility();
		
		int identiNum = branch.getFacility();
		List<Integer> checkFacility = new ArrayList<Integer>();
		for(int i=facilityList.size()-1; i>=0; i--) {
			if(identiNum >= facilityList.get(i).getIdentyNum()) {
				checkFacility.add(1);
				identiNum -= facilityList.get(i).getIdentyNum();
			} else {
				checkFacility.add(0);
			}
		}
		System.out.println(branch);
		model.addAttribute("branch", branch);
		model.addAttribute("facilityList", facilityList);
		model.addAttribute("checkFacility", checkFacility);
		
		return "admin/branch/detail";
	}
	
	@PostMapping("modify")
	public String modify(@LoginAdmin User loginAdmin, Branch branch, String branchCode) {
		
		// 업데이트 관련 쿼리문, Dao, Service 짜야함
		
		return "admin/branch/home";
	}
}
