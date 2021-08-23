package com.hmc.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.exception.FindException;
import com.hmc.exception.LoginException;
import com.hmc.service.UserService;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@ExceptionHandler(LoginException.class)
	public String handleLoginException(LoginException ex, Model model) {
		ex.printStackTrace();
		
		model.addAttribute("error", ex);
		return "login/loginForm";
	}
	
	@ExceptionHandler(FindException.class)
	public String handleFindException(FindException ex, Model model) {
		ex.printStackTrace();
		
		model.addAttribute("error", ex);
		return "login/userNotFound";
	}
	
	private static Logger logger = LogManager.getLogger(LoginController.class);
	
	@GetMapping("/")
	public String loginform() {
		return "login/loginForm";
	}
	// 로그인
	@PostMapping("/")
	public String login(@RequestParam("id") String userId, @RequestParam("password") String password) {
		userService.login(userId, password);
		
		// 로그인 전 페이지로 되돌아가기
		String returnUri = (String) SessionUtils.getAttribute("returnUri");
		String returnParameter = (String) SessionUtils.getAttribute("returnParameter");
		SessionUtils.removeAttribute("returnUri");
		SessionUtils.removeAttribute("returnParameter");
		System.out.println(returnUri);
		if (returnUri != null && returnParameter != null) {
			return "redirect:" + returnUri + "?" + returnParameter;
			
		} else if(returnUri != null && returnParameter == null){
			return "redirect:" + returnUri;
			
		}
		
		return "redirect:../home";
	}
	// 로그아웃
	@GetMapping("/logOut")
	public String logOut() {
		SessionUtils.destroySession();
		return"redirect:../home";
	}
	// 아이디 찾기
	@GetMapping("/findId")
	public String findId() {
		return "login/findId";
	}
	// 찾은 아이디 공지
	@PostMapping("/findId")
	public String informId(@RequestParam("phone") String phone, @RequestParam("email") String email, Model model) {
		
		String findId = userService.findId(phone, email);
		model.addAttribute("findId", findId);
		
		return "login/informId";
	}
	// 비밀번호 찾기
	@GetMapping("/findPwd")
	public String findPwd() {
		return "login/findPwd";
	}
	// 임시비밀번호 발급
	@PostMapping("/findPwd")
	public String informPwd(@RequestParam("id") String id, @RequestParam("email") String email, Model model) {
		String findPwd = userService.findPwd(id, email);
		model.addAttribute("findPwd", findPwd);
		
		return "login/infomPwd";
	}
}
