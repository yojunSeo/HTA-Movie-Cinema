package com.hmc.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.dao.UserDao;
import com.hmc.vo.User;

@Controller
public class UserAjaxController {
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping(path = "/register/confirm", produces = "text/plain")
	public @ResponseBody ResponseEntity<String> getUserById(@RequestParam("id") String id){
		String isExist = "false";
		User findUser = userDao.getUserById(id);
		if(findUser != null) {
			isExist = "true";
		}
		return new ResponseEntity<String>(isExist,HttpStatus.OK);
	}

}
