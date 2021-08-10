package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.service.BookingService;
import com.hmc.service.UserService;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@RestController
@RequestMapping("/mypage/rest")
public class MypageAjaxController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/user/grade")
	public Map<String, Object> getUserGradeExpected(){
		Map<String, Object> result = userService.getUserExpectedGrade();
		return result;
	}
	
}
