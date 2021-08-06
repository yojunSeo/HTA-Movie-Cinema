package com.hmc.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.dao.UserDao;
import com.hmc.service.UserService;
import com.hmc.service.UserServiceImpl;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginUser;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService userSerivce;
	UserDao userDao;
	
	@GetMapping("/home")
	public String user(@RequestParam(value="userId", required = false)String userId, Model model) throws Exception {
		
		User user = new User();
		
		//user = userDao.getUserById(userId);
		SessionUtils.addAttribute("LOGINED_USER", user);
		model.addAttribute("LOGINED_USER", user);
		
		
		return "mypage/home";
	}
	
}
