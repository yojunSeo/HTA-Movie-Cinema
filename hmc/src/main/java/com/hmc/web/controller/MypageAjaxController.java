package com.hmc.web.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.service.BookingService;
import com.hmc.service.ReviewService;
import com.hmc.service.UserService;
import com.hmc.vo.Branch;
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
	@Autowired
	private BookingService bookingService;

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
	 
	 @RequestMapping("/review/modify")
	 public void updateReview(@LoginUser User user,@RequestParam("reviewCode")String reviewCode,
			 @RequestParam("score")int score, @RequestParam("date")String date,  @RequestParam("content")String content) throws ParseException{
		 Review review = reviewService.getReviewByCode(reviewCode);
		 review.setScore(score);
		 review.setContent(content);
		 review.setModifiedDate(new Date());
		 reviewService.updateReview(review);
	 }
	 
	 @RequestMapping("/review/delete")
	 public void deleteReview(@LoginUser User user,@RequestParam("reviewCode")String reviewCode) {
		 reviewService.deleteReview(reviewCode);
	 }
	 
	 @RequestMapping("/user/review")
	 public List<Review> getUserReviews(){
		 return reviewService.getReviewByUserId();
	 }
	 
	 @RequestMapping("/user/branchs")
	 public List<Branch> getUserBranchs(){
		 List<Branch> branchs = userService.getUserFavoriteBranch();
		 return branchs;
	 }
	 
	 @RequestMapping("/mybranchs")
	 public Map<String, Object> getMyBranchs(){
		 Map<String, Object> result = new HashMap<String, Object>();
		 List<Branch> branchs = userService.getAllBranchs();
		 List<Branch> myBranchs = userService.getUserFavoriteBranch();
		 result.put("branchs", branchs);
		 result.put("myBranchs", myBranchs);
		 return result;
	 }
	 
	 @RequestMapping("/mybranchs/update")
	 public void updateMyBranchs(@LoginUser User user, @RequestParam(name = "branch1", required = false)String branch1,@RequestParam(name = "branch2", required = false)String branch2,
			 								@RequestParam(name = "branch3", required = false)String branch3 ) {
		 user.setFavoriteBranch1(branch1);
		 user.setFavoriteBranch2(branch2);
		 user.setFavoriteBranch3(branch3);
		 userService.updateUser(user);
	 }
	 
	 /**
	  * 이메일 중복확인
	  * @param email
	  * @return 불린값
	  */
	 @RequestMapping(path = "/confirmEmail", produces="text/plain")
	 public @ResponseBody ResponseEntity<String> getUserByEmail(@RequestParam("email") String email){
		 String isExist = "false";
		 User findUser = userService.getUserByEmail(email);
		 if(findUser != null) {
			 isExist = "true";
		 }
		 return new ResponseEntity<String>(isExist,HttpStatus.OK);
	 }
	 
	 /**
	  * 휴대폰번호 중복 확인
	  * @param phone
	  * @return 불린값
	  */
	 @RequestMapping(path = "/confirmPhone", produces="text/plain")
	 public @ResponseBody ResponseEntity<String> getUserByPhone(@RequestParam("phone") String phone){
		 String isExist = "false";
		 User findUser = userService.getUserByPhone(phone);
		 if(findUser != null) {
			 isExist = "true";
		 }
		 return new ResponseEntity<String>(isExist,HttpStatus.OK);
	 }
	 
	 @RequestMapping("/booking/modal")
	 public Map<String, Object> getBookingModalInfo(@RequestParam("scheduleCode")String scheduleCode, @RequestParam("bookingCode")String bookingCode){
		 Map<String, Object> result = bookingService.getBookingModalInfo(scheduleCode, bookingCode);
		 return result;
	 }
	 
	 /**
	  * 비밀번호 변경 전 기존 비밀번호 확인
	  * @param beforePwd
	  * @return 불린값
	  */
	 @RequestMapping(path = "/confirmPwd", produces="text/plain")
	 public @ResponseBody ResponseEntity<String> confirmPwd(@RequestParam("beforePwd") String beforePwd){
		 String isExist = "false";
		 User findUser = (User)SessionUtils.getAttribute("LOGINED_USER");
		 String secretPwd = DigestUtils.sha256Hex(beforePwd);
		 if(!(findUser.getPassword()).equals(secretPwd)) {
			 isExist = "true";
		 }
		 return new ResponseEntity<String>(isExist,HttpStatus.OK);
	 }
}
