package com.hmc.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.MallService;
import com.hmc.vo.Product;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@Autowired
	MallService mallService;
	
	@GetMapping("/")
	public String storeMain(Model model) {
		
		List<String> categories = mallService.getAllProductCategory();
		model.addAttribute("categories", categories);
		List<Product> productList = mallService.getAllProduct(); 
		model.addAttribute("products", productList);
		
		return "store/main";
	}
	
	@GetMapping("/detail")
	public String productDetail(@RequestParam("code") String productCode, Model model) {
		
		Product finededProduct = mallService.getProductByCode(productCode);
		
		model.addAttribute("product", finededProduct);
		
		return "store/detail";
	}
	
}
