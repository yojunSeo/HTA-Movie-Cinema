package com.hmc.web.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.service.BookingService;
import com.hmc.service.ReviewService;
import com.hmc.service.UserService;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginUser;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService userSerivce;
	@Autowired
	BookingService bookingService;
	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/home")
	public String user(@LoginUser User user, Model model) throws Exception {
		model.addAttribute("bookings", bookingService.getUserBookingDetail(user.getId()));
		model.addAttribute("reviews", reviewService.getReviewByUserId());
		model.addAttribute("today", new Date());
		return "mypage/home";
	}

	
}
