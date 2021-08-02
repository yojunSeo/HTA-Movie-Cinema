package com.hmc.service;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieService {
	
	Movie getMoviebyCode(int movieCode);
	
	void saveMoviesFromApi();

	List<Movie> getMoiveInfo();

	List<Movie> getMovieRanking();
	
}
