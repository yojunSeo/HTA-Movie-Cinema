package com.hmc.service;

import java.util.List;

import com.hmc.vo.Review;

public interface ReviewService {
	
	List<Review> getReviewByUserId();
	
	void insertReview(Review review);

}
