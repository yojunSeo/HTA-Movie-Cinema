package com.hmc.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.vo.Register;
import com.hmc.vo.User;

import oracle.jdbc.proxy.annotation.GetProxy;

@Controller
@RequestMapping("/register")
public class RegisterController {
   
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
	   System.out.println("dsasdass");
	   User user = new User();
	   BeanUtils.copyProperties(register, user);
	   return "redirect:/login/";
   }

}