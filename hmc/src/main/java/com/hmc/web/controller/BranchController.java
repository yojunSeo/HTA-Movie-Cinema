package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.dto.BranchDetailDto;
import com.hmc.service.BranchService;
import com.hmc.vo.Branch;
import com.hmc.vo.Facility;

@Controller
@RequestMapping("branch")
public class BranchController {
	
	@Autowired
	BranchService branchService;

	
	@GetMapping("/")
	public String allBranchInfo(Model model) {
		
		List<Branch> branchs = branchService.getAllBranch();
		
		model.addAttribute("branchList", branchs);
		
		return "branch/main";
	}
	
	@RequestMapping("/json/all")
	@ResponseBody
	public ResponseEntity<List<Branch>> getAllBranch() {
		List<Branch> branchs = branchService.getAllBranch();
		if (branchs == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(branchs, HttpStatus.OK);
	}
	
	@GetMapping("/json/branch")
	@ResponseBody
	public ResponseEntity<Branch> getBranchByCode(@RequestParam("code") String code) {
		Branch branch = branchService.getBranchByCode(code);
		return new ResponseEntity<>(branch, HttpStatus.OK);
	}
	
	@GetMapping("/detail")
	public String detailBranchInfo(@RequestParam("code") String branchCode, Model model) {
		
		BranchDetailDto branchDto = branchService.getBranchDetailByCode(branchCode);
		
		List<Facility> facilityList = branchService.getAllFacility();
		int identiNum = branchDto.getFacility();
		List<Integer> checkFacility = new ArrayList<Integer>();
		
		for(int i=facilityList.size()-1; i>=0; i--) {
			if(identiNum >= facilityList.get(i).getIdentyNum()) {
				checkFacility.add(1);
				identiNum -= facilityList.get(i).getIdentyNum();
			} else {
				checkFacility.add(0);
			}
		}
		System.out.println(checkFacility);
		
		model.addAttribute("branchDetail", branchDto);
		model.addAttribute("facility", checkFacility);
		
		return "branch/detail";
	}
	

	@GetMapping("/timetable")
	public String timeBranch(@RequestParam("code") String branchCode) {
		
		return "branch/time";
	}
	
	@GetMapping("/price")
	public String priceBranch() {
		
		return "branch/price";
	}
	

}
