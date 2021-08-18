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
	public String modify(@LoginAdmin User loginAdmin, Branch branch) {
		

		branchService.updateBranch(branch);
		System.out.println("===========post로 넘어오는 값 확인====================");
		System.out.println("지점 코드" + branch.getCode());
		System.out.println("지점 이름" + branch.getName());
		System.out.println("지점 시설" + branch.getFacility());
		System.out.println("지점 주소" + branch.getAddress());
		System.out.println("지점 상태" + branch.getStatus());
		System.out.println("지점 위도" + branch.getLatitude());
		System.out.println("지점 경도" + branch.getLongitude());
		System.out.println("지점 정보" + branch.getInfo());
		System.out.println("지점 주차" + branch.getParkingInfo());
		System.out.println("======================================================");
		
		return "redirect:/admin/branch/home";
	}
}
