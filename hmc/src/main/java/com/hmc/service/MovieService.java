package com.hmc.service;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieService {
	
		
	void saveMoviesFromApi() throws Exception;
		 
	void insertMovie(Movie movie);

	void updateMovie(Movie savedMovie);

	Movie getMovieDetail(String movieCode);

	List<Movie> getTopMovies(int rank);

	List<Movie> getNowMovie();

	List<Movie> getCommingMovie();

}
