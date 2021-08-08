package com.hmc.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.Movie;
import com.hmc.vo.Room;
import com.hmc.vo.ScreenMovie;
import com.hmc.web.form.ScheduleForm;

public interface AdminScheduleService {

	List<ScreenMovie> getAllScreenMovies();
	
	Movie getMovieInfoByCode(String movieCode);
	
	ScreenMovie getScreenMovieByCode(String screenCode);
	
	List<Branch> getAllBranchs();
	
	List<Room> getRoomsByBranchCode(String branchCode);
	
	String getBranchNameByCode(String branchCode);
	
	List<ScreenMovie> getScreenMovies(Map<String, Object> condition);	

	ScreenMovie screenRegisterAndGetScreenMovie(ScreenMovie screenMovie);
	
	String getEndTime(String startTime, String screenCode) throws ParseException;
	
	List<ScheduleDetail> getBranchSchedule(String branchCode, String screenDate);
	
	List<String> scheduleRegisterAndGetScheduleInfo(ScheduleForm scheduleForm) throws ParseException;
	
	Map<String, Object> screenMovieList(int pageNo);
	
	Map<String, Object> scheduleListPagination(int pageNo);
	
	Map<String, Object> searchSchedule(Map<String, Object> param);
	
	List<String> getScreenMovieWithoutSchedule();
	
	void deleteScreenMovie(String screenCode);
	
	void updateScreenMovieEndTime(String screenCode, String endDate) throws ParseException;
}
