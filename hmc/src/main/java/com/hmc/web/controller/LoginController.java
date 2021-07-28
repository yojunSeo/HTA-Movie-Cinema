package com.hmc.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	private static Logger logger = LogManager.getLogger(LoginController.class);
	
	@GetMapping("/")
	public String loginform() {
		return "login/loginForm";
	}
	
	@PostMapping("/")
	public String login() {
		return "home";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "login/findId";
	}
	
	@PostMapping("/findId")
	public String informId() {
		return "login/informId";
	}
	
	@GetMapping("/findPwd")
	public String findPwd() {
		return "login/findPwd";
	}
	
	@PostMapping("/findPwd")
	public String informPwd() {
		return "login/infomPwd";
	}
	
	
	

}
