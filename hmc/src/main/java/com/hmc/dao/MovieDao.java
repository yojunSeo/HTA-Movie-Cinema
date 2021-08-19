package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieDao {
	
	List<Movie> getAllNonScreenMovie();
	
	Movie getMovieInfoByCode(String movieCode);
	
	void insertMovie(Movie movie);

	void updateMovie(Movie movie);
	
	List<Movie> getNowMovie();

	List<Movie> getCommingMovie();
	
	List<Movie> getAllMovieCode();
	
	List<Movie> getNowAllMovies();
		
	List<Movie> getCommingAllMovies();
	
	void updateReviewCnt(String movieCode);
	
	void updateReviewTotalScore(String movieCode);
	
	void resetMovieRanking();
}
