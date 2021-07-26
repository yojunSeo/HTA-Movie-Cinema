package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {

	@GetMapping(path = {"/", "/test"})
	public String testHome() {
		// 커밋 테스트
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
