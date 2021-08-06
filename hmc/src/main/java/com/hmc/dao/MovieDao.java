package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieDao {

	List<Movie> getAllNonScreenMovie();
	
	Movie getMovieInfoByCode(String movieCode);
	
	void insertMovie(Movie movie);

	void updateMovie(Movie savedMovie);

	List<Movie> getTopMovies(int rank);


	

}
