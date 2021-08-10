package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/main")
	public String adminMain(@LoginAdmin User admin) {
		return "admin/main";
	}
}
