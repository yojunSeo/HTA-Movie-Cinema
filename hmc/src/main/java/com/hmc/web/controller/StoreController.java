package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@GetMapping("/")
	public String storeMain() {
		
		return "store/main";
	}
	
	@GetMapping("/detail")
	public String productDetail() {
		
		return "store/detail";
	}
	
}
