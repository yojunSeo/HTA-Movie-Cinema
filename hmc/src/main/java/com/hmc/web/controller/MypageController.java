package com.hmc.web.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.BookingService;
import com.hmc.service.ReviewService;
import com.hmc.service.UserService;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginUser;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	UserService userSerivce;
	@Autowired
	BookingService bookingService;
	@Autowired
	ReviewService reviewService;

	@GetMapping(path = {"/home" , "/booking"})
	public String goToHome(@LoginUser User user, Model model) throws Exception {
		model.addAttribute("bookings", bookingService.getUserBookingDetail(user.getId()));
		model.addAttribute("reviews", reviewService.getReviewByUserId());
		model.addAttribute("today", new Date());
		return "mypage/bookinghistory";
	}
	
	@GetMapping("/gift")
	public String giftHistory(@LoginUser User user, Model model) throws Exception {
		return "mypage/gifthistory";
	}
	
	@GetMapping("/coupon")
	public String myCoupon(@LoginUser User user, Model model) throws Exception {
		return "mypage/mycoupon";
	}
	
	@GetMapping("/event")
	public String myEvent(@LoginUser User user, Model model) throws Exception {
		return "mypage/myevent";
	}
	
	@GetMapping("/myinfo")
	public String modifyUserInfo(@LoginUser User user, Model model) throws Exception {
		return "mypage/usermodify";
	}
	
	@GetMapping("/withdrawal")
	public String withdrawalUser(@LoginUser User user, Model model) throws Exception {
		return "mypage/userwithdrawal";
	}
	
	@GetMapping("/successWithdrawal")
	public String successWithdrawal(@LoginUser User user) {
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		loginedUser.setWithdrawalDate(new Date());
		userSerivce.deleteUser(loginedUser);
		SessionUtils.destroySession();
		return "redirect:../home?deny=witdrawal";
	}
	
	@GetMapping("/changePwd")
	public String changePassword(@LoginUser User user, Model model) throws Exception {
		return "mypage/pwdchange";
	}
	
	@GetMapping("/cancelBooking")
	public String cancelBooking(@RequestParam("bookingCode")String bookingCode) {
		bookingService.cancelBooking(bookingCode);
		return "redirect:booking";
	}

	
}
