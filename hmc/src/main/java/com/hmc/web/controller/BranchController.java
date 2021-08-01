package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("branch")
public class BranchController {
	
	@GetMapping("/")
	public String allBranchInfo() {
		
		return "branch/main";
	}
	
	@GetMapping("/detail")
	public String detailBranchInfo() {
		
		return "branch/detail";
	}
	

	@GetMapping("/timetable")
	public String timeBranch() {
		
		return "branch/time";
	}
	
	@GetMapping("/price")
	public String priceBranch() {
		
		return "branch/price";
	}
}
