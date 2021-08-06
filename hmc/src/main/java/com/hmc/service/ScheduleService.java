package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.dto.BranchDto;
import com.hmc.dto.MovieDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.User;

public interface ScheduleService {
	
	User getUserById(String userId); 
	
	List<Branch> getUserFavoriteBranchs(User user);
	
	List<ScheduleDetail> getBranchSchedulesByDate(Map<String, Object> condition);
	
	ScheduleDetail getScheduleDetail(String scheduleCode);
	
	List<Map<String, Object>> getBookingSeat(String scheduleCode);
	
	Map<String, Object> getSeatByCode(String seatCode);
	
	Map<String, Object> getBookedAndRoomSeats(String scheduleCode);
	
	Map<String, Object> branchSheduleinfo();
	
	List<Branch> getAreaBranch(String area);
	
	List<MovieDto> getMovieSchedule(String branchCode, String screenDate);
	
	Map<String, Object> getMovieSheduleinfo();
	
	List<BranchDto> getBranchSchedule(String screenCode, String screenDate);
	
}
