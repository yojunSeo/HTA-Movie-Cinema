package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Schedule;

public interface ScheduleDao {

	/**
	 * 
	 * @param schedule
	 */
	void insertSchedule(Schedule schedule);
	
	/**
	 * 
	 * @param schedule
	 */
	void updateSchedule(Schedule schedule);
	
	/**
	 * 
	 * @param schedule
	 */
	void deleteSchedule(Schedule schedule);
	
	/**
	 * 
	 * @return
	 */
	List<Schedule> getAllSchedules();
	
	/**
	 * 
	 * @param scheduleCode
	 * @return
	 */
	Schedule getScheduleByCode(String scheduleCode);
}
