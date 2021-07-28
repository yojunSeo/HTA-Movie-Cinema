package com.hmc.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
}
