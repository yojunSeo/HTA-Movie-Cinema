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
		// 영화별 리뷰 개수와 리뷰 총점을 DB에 업데이트
		movieDao.updateReviewCnt(movieCode);
		movieDao.updateReviewTotalScore(movieCode);
		return movieDao.getMovieInfoByCode(movieCode);
	}
	
	@Override
	public void saveMoviesFromApi() throws Exception {
		// 영화상세정보와 영화순위정보를 API에서 받아서 DB에 저장
		movieApiService.saveMoviesFromApi();
		// 영화 순위정보 API에서 받아서 DB에 업데이트
		movieApiService.updateMovieRanking();	
	}


	@Override
	public void insertMovie(Movie movie) {
	}

	@Override
	public void updateMovie(Movie savedMovie) {
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
	

	
	
	

