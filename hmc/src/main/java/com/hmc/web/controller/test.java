package com.hmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class test {

	@GetMapping(path = {"/", "/test"})
	public String testHome() {
<<<<<<< HEAD

		// 이클립스와 소스트리를 연동해봤습니다. 테스트
=======
		// 커밋 테스트
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
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
