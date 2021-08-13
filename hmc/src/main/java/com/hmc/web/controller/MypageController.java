package com.hmc.web.controller;

import java.util.Date;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.exception.FindException;
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
   
   @GetMapping("/home")
   public String goToHome(@LoginUser User user, Model model) throws Exception {
      model.addAttribute("bookings", bookingService.getUserBookingDetail(user.getId()));
      model.addAttribute("reviews", reviewService.getReviewByUserId());
      model.addAttribute("today", new Date());
      return "mypage/bookinghistory";
   }
   
   @GetMapping("/booking")
   public String bookingHistory(@LoginUser User user, Model model) throws Exception {
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
   
   @GetMapping("/changePwd")
   public String changePassword(@LoginUser User user, Model model) throws Exception {
      return "mypage/pwdchange";
   }
   
   @GetMapping("/successWithdrawal")
   public String successWithdrawal(@LoginUser User user) {
      User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
      loginedUser.setWithdrawalDate(new Date());
      userSerivce.deleteUser(loginedUser);
      SessionUtils.destroySession();
      return "redirect:../home?witdrawal=true";
   }
   
   @GetMapping("/checkUser")
   public String checkUser(@LoginUser User user) {
	   return"mypage/checkUser";
   }
   
   @PostMapping("/checkUser")
   public String checkUser(@LoginUser User user, @RequestParam("id") String id, @RequestParam("password") String password) {
	   User savedUser = userSerivce.getUserById(id);
	   String secretPwd = DigestUtils.sha256Hex(password);
	   
	   if(savedUser == null) {
		   return "redirect:checkUser?notFoundUser=true";
		   
	   } else if(!savedUser.getPassword().equals(secretPwd)) {
		   return "redirect:checkUser?notFoundUser=true";
	   }
	   
	   return"mypage/changeMyInfo";
   }
   
   @PostMapping("changeMyInfo")
   public String changeMyInfo(@RequestParam("email") String email, @RequestParam("phone") String phone, @RequestParam("id") String id) {
	   User user = userSerivce.getUserById(id);
	   user.setEmail(email);
	   user.setPhone(phone);
	   userSerivce.updateUser(user);
	   SessionUtils.addAttribute("LOGINED_USER", user);
	   
	   return "redirect:home";
	   
   }

   
}