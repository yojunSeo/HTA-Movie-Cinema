package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.dto.BranchScheduleDto;
import com.hmc.dto.MovieScheduleDto;

public interface ScheduleDtoDao {

	BranchScheduleDto getBranchSchedulesByMovie(Map<String, Object> param);
	
	MovieScheduleDto getMoiveSchedulesByBranch(Map<String, Object> param);
	
	List<String> getBranchMovies(String branchCode);
}
