package com.hmc.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hmc.vo.Schedule;

public interface ScheduleDao {

	/**
	 * 상영스케줄 정보를 전달받아서 데이터베이스에 저장한다.
	 * @param schedule
	 */
	void insertSchedule(Schedule schedule);
	
	/**
	 * 상영스케줄 정보를 변경한다.
	 * @param schedule 변경된 정보가 담긴 Schedule객체
	 */
	void updateSchedule(Schedule schedule);
	
	/**
	 * 스케쥴코드를 전달받아서 상영스케줄을 삭제한다
	 * @param scheduleId 삭제할 스케쥴 코드
	 */
	void deleteSchedule(String scheduleCode);
	
	/**
	 * 모든 상영스케줄을 출력한다.
	 * @return 모든 상영스케줄
	 */
	List<Map<String, Object>> getAllSchedules();
	
	/**
	 * 스케줄코드를 전달받아 해당하는 상영정보를 반환한다.
	 * @param scheduleCode 스케줄코드
	 * @return 해당하는 상영정보
	 */
	Map<String, Object> getScheduleByCode(String scheduleCode);
	
	Date getEndTime(Map<String, Object> condition);
	
	List<Map<String, Object>> getBranchSchedulesByDate(Map<String, Object> condition);
}
