package com.hmc.service;

import java.util.List;

import com.hmc.vo.Review;

public interface ReviewService {
	
	List<Review> getReviewByUserId();
	
	void insertReview(Review review);
	
	void updateReview(Review review);

	Review getReviewByCode(String reviewCode);
	
	void deleteReview(String reviewCode);

	List<Review> getReviewByMovieCode(String movieCode);
}
