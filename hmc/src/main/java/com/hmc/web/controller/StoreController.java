package com.hmc.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.dao.UserDao;
import com.hmc.service.MallService;
import com.hmc.vo.Product;
import com.hmc.vo.User;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@Autowired
	MallService mallService;
	
	@Autowired
	UserDao userDao;
	
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
	
	@RequestMapping("/purchase")
	public String purchase(@RequestParam("amount") int amount, @RequestParam("totalPrice") int totalPrice,
						@RequestParam("productCode") String productCode, Model model) {
		model.addAttribute("amount", amount);
		model.addAttribute("totalPrice", totalPrice);
		
		Product findedProduct = mallService.getProductByCode(productCode);
		model.addAttribute("product", findedProduct);
		
		return "store/payment";
	}
	
	@RequestMapping("/present")
	public String present(@RequestParam("amount") int amount, @RequestParam("totalPrice") int totalPrice,
			@RequestParam("productCode") String productCode,@RequestParam("giftRecipienId") String giftRecipienId, Model model) {
		
		model.addAttribute("amount", amount);
		model.addAttribute("totalPrice", totalPrice);
		
		Product findedProduct = mallService.getProductByCode(productCode);
		model.addAttribute("product", findedProduct);
		
		User giftRecipien = userDao.getUserById(giftRecipienId);
		model.addAttribute("giftRecipien", giftRecipien);
		
		return "store/payment";
	}
}
