package com.hmc.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.service.BookingService;
import com.hmc.service.ReviewService;
import com.hmc.service.UserService;
import com.hmc.vo.Review;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginUser;
import com.hmc.web.util.DateUtils;
import com.hmc.web.util.SessionUtils;

@RestController
@RequestMapping("/mypage/rest")
public class MypageAjaxController {

	@Autowired
	private UserService userService;
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/user/grade")
	public Map<String, Object> getUserGradeExpected() {
		Map<String, Object> result = userService.getUserExpectedGrade();
		return result;
	}

	
	 @RequestMapping("/review/register") 
	 public void registerReview(@LoginUser User user,@RequestParam("screenCode")String screenCode, @RequestParam("bookingCode")String bookingCode,
			 @RequestParam("score")int score, @RequestParam("date")String date,  @RequestParam("content")String content) throws ParseException{
		 	
		 Review review = new Review();
		 review.setBookingCode(bookingCode);
		 review.setScreenCode(screenCode);
		 review.setScore(score);
		 review.setContent(content);
		 review.setCreatedDate(DateUtils.stringToDate(date));
		 review.setUserId(user.getId());
		 reviewService.insertReview(review);
	 }
	 
	 @RequestMapping("/user/review")
	 public List<Review> getUserReviews(){
		 return reviewService.getReviewByUserId();
	 }
	 
}
