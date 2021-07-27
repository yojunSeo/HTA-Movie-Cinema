package com.hmc.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegisterController {
   
   private static Logger logger = LogManager.getLogger(RegisterController.class);
   
   @GetMapping("/register")
   public String register() {
      return "register/agreeRegister";
      //
   }

}