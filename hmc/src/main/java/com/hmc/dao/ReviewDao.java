package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Review;

public interface ReviewDao {
	
	List<Review> getAllReviews();
	
	List<Review> getReviewsByUserId(String userId);
	
	void insertReview(Review review);
	
	/**
	 * 리뷰코드와 일치하는 리뷰의 공개여부를 변경
	 * @param reviewCode 리뷰코드 번호
	 */
	void deleteReview(String reviewCode);
	
	void updateRivew(Review review);
	
	Review getReviewByCode(String reviewCode);
	
	List<Review> getReviewByMovieCode(String movieCode);
}
