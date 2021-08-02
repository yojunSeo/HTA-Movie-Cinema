package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/home/main")
	public String mainHome() {
		
		return "home/main";
	}
}
