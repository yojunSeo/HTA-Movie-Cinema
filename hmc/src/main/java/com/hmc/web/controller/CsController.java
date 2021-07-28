package com.hmc.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	private static Logger logger = LogManager.getLogger(CsController.class);
	
	@GetMapping("/")
	public String notice() {
		return "cs/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail() {
		return "cs/noticeDetail";
	}
	
	@GetMapping("/membership")
	public String membership() {
		return "cs/membership";
	}
	
	@GetMapping("/inqueryForm")
	public String inqueryForm() {
		return "cs/inqueryForm";
	}
	
	@PostMapping("/submitInquery")
	public String submitInquery() {
		return "../home";
	}

}
