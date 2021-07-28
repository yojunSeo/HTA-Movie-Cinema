package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class test {

	@GetMapping("/")
	public String testHome() {
		// 이클립스와 소스트리를 연동해봤습니다. 테스트
		return "test/home";
	}
	
	@GetMapping("test/seo")
	public String testSeo() {
		// 커밋 테스트
		return "test/seo";
	}
	@GetMapping("test/lim")
	public String testLim() {
		return "test/lim";
	}
	@GetMapping("test/lee")
	public String testlee() {
		return "test/lee";
	}
}
