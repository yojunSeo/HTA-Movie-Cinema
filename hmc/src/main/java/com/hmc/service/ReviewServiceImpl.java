package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.ReviewDao;
import com.hmc.vo.Review;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDao reviewDao;
	
	@Override
	public List<Review> getReviewByUserId() {
		String userId = ((User)SessionUtils.getAttribute("LOGINED_USER")).getId();
		return reviewDao.getReviewsByUserId(userId);
	}
	
	@Override
	public void insertReview(Review review) {
		reviewDao.insertReview(review);
	}
	
	@Override
	public void updateReview(Review review) {
		reviewDao.updateRivew(review);
	}
	
	@Override
	public void deleteReview(String reviewCode) {
		reviewDao.deleteReview(reviewCode);
	}
	
	@Override
	public Review getReviewByCode(String reviewCode) {
		return reviewDao.getReviewByCode(reviewCode);
	}

}
