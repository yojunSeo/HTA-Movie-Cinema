package com.hmc.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.service.UserService;
import com.hmc.vo.Register;
import com.hmc.vo.User;
import com.hmc.exception.LoginException;
import com.hmc.exception.UserRegisterException;


@Controller
@RequestMapping("/register")
public class RegisterController {
	
	@Autowired
	UserService userService;
	
	@ExceptionHandler(UserRegisterException.class)
	public String handleUserRegisterException(UserRegisterException ex, Model model) {
		ex.printStackTrace();	// 예외처리 중간 과정 확인
		model.addAttribute("error", ex);
		return "register/registerForm";
	}

	private static Logger logger = LogManager.getLogger(RegisterController.class);

	
	@GetMapping("/")
	public String agreeRegister() {
		return "register/agreeRegister";
	}

	@GetMapping("/form")
	public String registerForm() {
		return "register/registerForm";
	}

	@PostMapping("/form")
	public String register(Register register) {
		
		User user = new User();
		BeanUtils.copyProperties(register, user);
		
		userService.register(user);
		
		return "redirect:../login/";
	}

}