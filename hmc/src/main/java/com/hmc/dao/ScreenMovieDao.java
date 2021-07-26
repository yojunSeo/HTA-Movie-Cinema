package com.hmc.dao;

import java.util.List;

import com.hmc.vo.ScreenMovie;

public interface ScreenMovieDao {

	/**
	 * 상영중인 영화정보를 데이터베이스에 저장한다.
	 * @param screenMovie 상영중인 영화정보
	 */
	void insertScreenMovie(ScreenMovie screenMovie);
	
	/**
	 * 상영중인 영화정보를 변경한다.
	 * @param screenMovie 변경된 정보가 포함되어 있는 상영영화정보
	 */
	void updateScreenMovie(ScreenMovie screenMovie);
	
	/**
	 * 상영중인 영화를 삭제한다.
	 * @param screenMovieCode 삭제할 상영중인영화 코드
	 */
	void deleteScreenMovie(String screenMovieCode);
	
	/**
	 * 현재 상영중인 영화를 모두 출력한다.
	 * @return 현재 상영중인 영화목록
	 */
	List<ScreenMovie> getAllScreenMovies();
	
	/**
	 * 상영영화코드로 상영중인 영화정보를 반환한다.
	 * @param screenMovieCode 상영영화 코드
	 * @return 코드에 해당하는 상영중인 영화정보
	 */
	ScreenMovie getScreenMovieByCode(String screenMovieCode);
}
