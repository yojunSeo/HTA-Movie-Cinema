package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieDao {

	List<Movie> getMoiveInfo();
	
	List<Movie> getMovieRanking();
	
	Movie getMovieByCode(int movieCode);
	
	void insertMovie(Movie movie); 
	
	void updateMovie(Movie savedMovie);

	
}
