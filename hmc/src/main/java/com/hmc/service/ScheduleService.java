package com.hmc.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hmc.vo.Branch;
import com.hmc.vo.Movie;
import com.hmc.vo.Room;
import com.hmc.vo.ScreenMovie;

public interface ScheduleService {

	List<Movie> getAllNonScreeMovies();
	
	List<ScreenMovie> getAllScreenMovies();
	
	Movie getMovieInfoByCode(String movieCode);
	
	void insertScreenMovie(ScreenMovie screenMovie);
	
	ScreenMovie getScreenMovieByCode(String screenCode);
	
	List<Branch> getAllBranchs();
	
	List<Room> getRoomsByBranchCode(String branchCode);
	
	List<Map<String, Object>> getAllSchedules();
	
	Date getEndTime(Map<String, Object> condition);
	
	List<Map<String, Object>> getBranchSchedulesByDate(Map<String, Object> condition);
	
	String getBranchNameByCode(String branchCode);
}