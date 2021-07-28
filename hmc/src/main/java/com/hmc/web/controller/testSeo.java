package com.hmc.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.service.BranchService;
import com.hmc.service.CouponService;

import com.hmc.service.MallService;
import com.hmc.vo.Product;

@Controller
@RequestMapping("/test/seo")
public class testSeo {

	@Autowired
	private MallService mallService;

	@GetMapping("product/test")
	public String productTest() {
		
		mallService.mallServiceTest();
		
		return "test/seo";
	}
	
	@GetMapping("gift/test")
	public String giftTest() {
		
		mallService.giftTest();
		
		return "test/seo";
	}
	
	@Autowired
	private BranchService branchService;
	
	@GetMapping("branch/test")
	public String branchTest() {
		
		branchService.branchServiceTest();
		
		return "test/seo";
	}
	
	@Autowired
	private CouponService couponService;
	
	@GetMapping("coupon/test")
	public String couponTest() {
		
		couponService.couponServiceTest();
		
		return "test/seo";
	}
	
	@GetMapping("publishedcoupon/test")
	public String publishedCouponTest() {
		
		couponService.publishedCouponServiceTest();
		
		return "test/seo";
	}

	@GetMapping("product/insert")
	public String insertProduct() {
		
		Product product = new Product();
		
		product.setCategory("식품");
		product.setName("팝콘");
		product.setPrice(5000);
		product.setStock(100);
		product.setMemo("테스트로 팝콘을 넣어봅니다.");
		
		mallService.insertProduct(product);
		
		return "";
	}
}
