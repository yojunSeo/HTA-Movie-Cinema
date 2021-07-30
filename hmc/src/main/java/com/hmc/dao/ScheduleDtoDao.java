package com.hmc.dao;

import java.util.Map;

import com.hmc.dto.BranchScheduleDto;

public interface ScheduleDtoDao {

	BranchScheduleDto getBranchSchedulesByMovie(Map<String, Object> param);
}
