package com.hmc.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.exception.LoginException;
import com.hmc.exception.UserRegisterException;
import com.hmc.service.BookingService;
import com.hmc.service.EventService;
import com.hmc.service.ReviewService;
import com.hmc.service.StoreService;
import com.hmc.service.UserService;
import com.hmc.service.PublishedCouponService;
import com.hmc.vo.Pagination;
import com.hmc.vo.PublishedCoupon;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;
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
	@Autowired
	StoreService storeService;
	@Autowired
	EventService eventService;
	@Autowired
	PublishedCouponService PublishedCouponService;
	
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 7;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;

	@GetMapping(path = {"/home" , "/booking"})
	public String goToHome(@LoginUser User user, Model model, @RequestParam(name = "page", required = false, defaultValue = "1") int pageNo) throws Exception {
		Map<String, Object> result =  bookingService.getUserBookingPage(pageNo);
		model.addAttribute("bookings", result.get("bookings"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("reviews", reviewService.getReviewByUserId());
		model.addAttribute("today", new Date());
		return "mypage/bookinghistory";
	}
	
	@GetMapping("/payment")
	public String giftPaymentHistory(@LoginUser User user,@RequestParam(name = "page",required = false, defaultValue = "1")int pageNo, Model model) throws Exception {
		Map<String, Object> result = storeService.getUserPaymentGifts(pageNo);
		model.addAttribute("payments", result.get("payments"));
		model.addAttribute("pagination", result.get("pagination"));
		return "mypage/giftpayment";
	}
	
	@GetMapping("/receive")
	public String giftReceiveHistory(@LoginUser User user,@RequestParam(name = "page",required = false, defaultValue = "1")int pageNo, Model model) throws Exception {
		Map<String, Object> result = storeService.getUserReceiveGifts(pageNo);
		model.addAttribute("receives", result.get("receives"));
		model.addAttribute("pagination", result.get("pagination"));
		return "mypage/giftreceive";
	}
	
	@GetMapping("/coupon")
	public String myCoupon(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model, @LoginUser User user) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		User loginedUser = (User)SessionUtils.getAttribute("LOGINED_USER");
		param.put("userId", loginedUser.getId());
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		
		List<Map<String, Object>> coupons = PublishedCouponService.getMyCouponsByUserId(param);
		
		model.addAttribute("coupons", coupons);
		System.out.println(coupons);
		int totalRows = PublishedCouponService.getTotalRows(param);
		int totalPages = (int) Math.ceil((double) totalRows/ROWS_PER_PAGE);
		int totalPageBlocks = (int)Math.ceil((double)totalPages/PAGES_PER_PAGE_BLOCK);
		int currentPageBlock = (int) Math.ceil((double)page/PAGES_PER_PAGE_BLOCK);
		int beginPage = (currentPageBlock -1)*PAGES_PER_PAGE_BLOCK+1;
		int endPage = currentPageBlock*PAGES_PER_PAGE_BLOCK;
		if(currentPageBlock == totalPageBlocks) {
			endPage = totalPages;
		}
		
		Pagination pagination = new Pagination();
		pagination.setPageNo(page);
		pagination.setTotalRows(totalRows);
		pagination.setTotalPages(totalPages);
		pagination.setTotalPageBlocks(totalPageBlocks);
		pagination.setCurrentPageBlock(currentPageBlock);
		pagination.setBeginPage(beginPage);
		pagination.setEndPage(endPage);
		
		model.addAttribute("pagination", pagination);
		return "mypage/mycoupon";
	}
	
	@GetMapping("/event")
	public String myEvent(@LoginUser User user, Model model) throws Exception {
		List<Map<String, Object>> events = eventService.getUserEventJoins(user.getId()); 
		model.addAttribute("events", events);
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
	
	@PostMapping("/changePwd")
	public String changePwd(@LoginUser User user, Model model, @RequestParam("password") String password) throws Exception {
		User savedUser = (User)SessionUtils.getAttribute("LOGINED_USER");
		String secretPwd = DigestUtils.sha256Hex(password);
		savedUser.setPassword(secretPwd);
		userSerivce.updateUser(savedUser);
		
		return "redirect:../home?changePwd=true";
	}
	
	@GetMapping("/cancelBooking")
	public String cancelBooking(@RequestParam("bookingCode")String bookingCode) {
		bookingService.cancelBooking(bookingCode);
		return "redirect:booking";
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
	   User confirmUser = (User)SessionUtils.getAttribute("LOGINED_USER");
	   String secretPwd = DigestUtils.sha256Hex(password);
	   
	   if(savedUser == null) {
		   return "redirect:checkUser?notFoundUser=true";
		   
	   } else if(!(savedUser.getId()).equals(confirmUser.getId())) {
		   return "redirect:checkUser?notCorrect=true";
		   
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
	   
	   return "redirect:home?changeMyInfo=true";
	   
   }

   @GetMapping("/payment/cancel")
   public String cancelGift(@RequestParam("giftCode")String giftCode) {
	   storeService.cancelGift(giftCode);
	   return "redirect:../payment";
   }
   
}