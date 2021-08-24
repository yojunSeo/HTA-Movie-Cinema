package com.hmc.service;

import java.util.List;

import com.hmc.vo.Movie;

public interface MovieService {
	
	
	/**
	 * 영화상세정보 API 조회 및 저장
	 * @throws Exception
	 */
	void saveMoviesFromApi() throws Exception;
	
	/**
	 * 영화 상세정보를 DB에 저장
	 * @param movie
	 */
	void insertMovie(Movie movie);

	/**
	 * DB에 저장된 상세정보를 업데이트
	 * @param savedMovie
	 */
	void updateMovie(Movie savedMovie);
	
	/**
	 * 영화코드로 영화 상세정보를 조회
	 * @param movieCode 영화코드
	 * @return 영화 상세정보
	 */
	Movie getMovieDetail(String movieCode);
	
	/**
	 * DB에 저장된 현재상영작 중 예매순위 상위5개 조회
	 * @return 현재상영작 리스트
	 */
	List<Movie> getNowMovie();

	/**
	 * DB에 저장된 상영예정작 중 개봉일이 가장 가까운 영화 5개 조회
	 * @return 상영예정작  리스트
	 */
	List<Movie> getCommingMovie();

	/**
	 * DB에 저장된 현재상영작 전체 조회
	 * @return 현재상영중인 리스트
	 */
	List<Movie> getNowAllMovies();

	/**
	 * DB에 저장된 상영예정작 전체 조회
	 * @return 상영예정작 리스트
	 */
	List<Movie> getCommingAllMovies();

}
