package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.dto.BranchScheduleDto;
import com.hmc.dto.MovieScheduleDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.User;

public interface ScheduleService {
	
	List<Branch> getAllBranchs();
	
	User getUserById(String userId); 
	
	List<Branch> getUserFavoriteBranchs(User user);
	
	List<ScheduleDetail> getBranchSchedulesByDate(Map<String, Object> condition);
	
	BranchScheduleDto getBranchScheduleByOrderMovie(Map<String, Object> condition);
	
	List<ScheduleDetail> getSchedulesByMovieAndDate(Map<String, Object> condition);
	
	MovieScheduleDto getMoiveSchedulesByBranch(Map<String, Object> param);
	
	List<Map<String, Object>> getScreenSimpleInfo();
	
	ScheduleDetail getScheduleDetail(String scheduleCode);
	
	
}
