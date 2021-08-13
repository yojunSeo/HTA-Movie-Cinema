package com.hmc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.dao.UserDao;
import com.hmc.service.StoreService;
import com.hmc.vo.GiftProduct;
import com.hmc.vo.Payment;
import com.hmc.vo.Product;
import com.hmc.vo.User;

@Controller
@RequestMapping("store")
public class StoreController {
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	UserDao userDao;
	
	@GetMapping("/")
	public String storeMain(Model model) {
		
		List<String> categories = storeService.getAllProductCategory();
		model.addAttribute("categories", categories);
		List<Product> productList = storeService.getAllProduct(); 
		model.addAttribute("products", productList);
		
		return "store/main";
	}
	
	@GetMapping("/detail")
	public String productDetail(@RequestParam("code") String productCode, Model model) {
		
		Product finededProduct = storeService.getProductByCode(productCode);
		
		model.addAttribute("product", finededProduct);
		
		return "store/detail";
	}
	
	@RequestMapping("/purchase")
	public String purchase(@RequestParam("amount") int amount, @RequestParam("totalPrice") int totalPrice,
						@RequestParam("productCode") String productCode, Model model) {
		model.addAttribute("amount", amount);
		model.addAttribute("totalPrice", totalPrice);
		
		Product findedProduct = storeService.getProductByCode(productCode);
		model.addAttribute("product", findedProduct);
		
		return "store/payment";
	}
	
	@RequestMapping("/present")
	public String present(@RequestParam("amount") int amount, @RequestParam("totalPrice") int totalPrice,
			@RequestParam("productCode") String productCode,@RequestParam("giftRecipienId") String giftRecipienId, Model model) {
		
		model.addAttribute("amount", amount);
		model.addAttribute("totalPrice", totalPrice);
		
		Product findedProduct = storeService.getProductByCode(productCode);
		model.addAttribute("product", findedProduct);
		
		User giftRecipien = userDao.getUserById(giftRecipienId);
		model.addAttribute("giftRecipien", giftRecipien);
		
		return "store/payment";
	}
	
	@RequestMapping("/success")
	public String success(@RequestParam("giveUser") String giveUserId, @RequestParam("receiveUser") String receiveUserId,
				@RequestParam("productCode") String productCode, @RequestParam("amount") int amount,
				@RequestParam("pricePayment") int pricePayment, @RequestParam("methodPayment") String methodPayment,
				@RequestParam("pointUsed") int pointUsed, @RequestParam("unitPrice") int unitPrice,
				Model model) {
		
		String beforeUserGrade = userDao.getUserById(giveUserId).getGrade();
		int beforePoint = userDao.getUserById(giveUserId).getPoint();
		
		Map<String, Object> paymentInfo = new HashMap<String, Object>();
		
		// PAYMENT 테이블에 정보 저장
		Payment payment = new Payment();
		payment.setUserId(giveUserId);
		payment.setPrice(pricePayment);
		payment.setWay(methodPayment);
		paymentInfo.put("payment", payment);
		
		// GIFT_PRODUCT 테이블에 정보 저장
		GiftProduct giftProduct = new GiftProduct();
		giftProduct.setProductCode(productCode);
		giftProduct.setGiveUser(giveUserId);
		giftProduct.setReceiveUser((receiveUserId == "" ? giveUserId : receiveUserId));
		giftProduct.setPrice(unitPrice);
		giftProduct.setAmount(amount);
		paymentInfo.put("giftProduct", giftProduct);
		
		paymentInfo.put("usedPoint", pointUsed);
		
		storeService.successPayment(paymentInfo);
		
		String afterUserGrade = userDao.getUserById(giveUserId).getGrade();
		
		int afterPoint = userDao.getUserById(giveUserId).getPoint();
		int plusPoint =  afterPoint - beforePoint + pointUsed;
				
		model.addAttribute("beforeGrade", beforeUserGrade);
		model.addAttribute("afterGrade", afterUserGrade);
		model.addAttribute("plusPoint", plusPoint);
		
		return "store/success";
	}
	
}
