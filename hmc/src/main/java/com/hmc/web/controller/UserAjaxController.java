package com.hmc.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.dao.UserDao;
import com.hmc.service.UserService;
import com.hmc.vo.User;

@Controller
public class UserAjaxController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(path = "/register/confirm", produces = "text/plain")
	public @ResponseBody ResponseEntity<String> getUserById(@RequestParam("id") String id){
		String isExist = "false";
		User findUser = userService.getUserById(id);
		if(findUser != null) {
			isExist = "true";
		}
		return new ResponseEntity<String>(isExist,HttpStatus.OK);
	}
	
	/**
	 * 스토어의 선물기능에서 선물받을 유저가 존재하는지 체크하고,
	 * 존재한다면 정보를 받아오는 메서드
	 * @author YOJUN SEO
	 * @param phone
	 * @return
	 */
	@RequestMapping("/store/json/usercheck")
	@ResponseBody
	public ResponseEntity<User>  presentUserCheckByPhone(@RequestParam("phone") String phone) {
		
		User findedUser = userService.getUserByPhone(phone);
		if(findedUser == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		// JSON정보를 내려보내기 전 비밀번호 삭제 처리
		findedUser.setPassword("");
		
		return new ResponseEntity<>(findedUser, HttpStatus.OK);
	}

}
