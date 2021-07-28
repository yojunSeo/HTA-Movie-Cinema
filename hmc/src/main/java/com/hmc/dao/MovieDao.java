package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieDao {

	List<Movie> getAllNonScreenMovie();
	
	Movie getMovieInfoByCode(String movieCode);
	
	 List<Movie> getAllMovies();
	   
	 List<Movie> getRankingMovies();
	   
	 Movie getMovieByCode(int movieCode);
	   
	 void insertMovie(Movie movie);
}
