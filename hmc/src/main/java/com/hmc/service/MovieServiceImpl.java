package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.MovieDao;
import com.hmc.vo.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDao movieDao;
	@Autowired
	MovieApiService movieApiService;
	  
	@Override
	public Movie getMovieDetail(String movieCode) {
		movieDao.updateReviewCnt(movieCode);
		movieDao.updateReviewTotalScore(movieCode);
		return movieDao.getMovieInfoByCode(movieCode);
	}
	
	@Override
	public void saveMoviesFromApi() throws Exception {
		movieApiService.saveMoviesFromApi();
		movieApiService.updateMovieRanking();	
	}


	@Override
	public void insertMovie(Movie movie) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMovie(Movie savedMovie) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Movie> getNowMovie() {
		return movieDao.getNowMovie();
	}

	@Override
	public List<Movie> getCommingMovie() {
		return movieDao.getCommingMovie();
	}

	@Override
	public List<Movie> getNowAllMovies() {
		return movieDao.getNowAllMovies();
	}

	@Override
	public List<Movie> getCommingAllMovies() {
		return movieDao.getCommingAllMovies();
	}
	
}
	

	
	
	

