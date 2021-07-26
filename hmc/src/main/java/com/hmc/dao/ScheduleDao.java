package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Schedule;

public interface ScheduleDao {

	/**
<<<<<<< HEAD
	 * 상영스케줄 정보를 전달받아서 데이터베이스에 저장한다.
=======
	 * 
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
	 * @param schedule
	 */
	void insertSchedule(Schedule schedule);
	
	/**
<<<<<<< HEAD
	 * 상영스케줄 정보를 변경한다.
	 * @param schedule 변경된 정보가 담긴 Schedule객체
=======
	 * 
	 * @param schedule
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
	 */
	void updateSchedule(Schedule schedule);
	
	/**
<<<<<<< HEAD
	 * 스케쥴코드를 전달받아서 상영스케줄을 삭제한다
	 * @param scheduleId 삭제할 스케쥴 코드
	 */
	void deleteSchedule(String scheduleCode);
	
	/**
	 * 모든 상영스케줄을 출력한다.
	 * @return 모든 상영스케줄
=======
	 * 
	 * @param schedule
	 */
	void deleteSchedule(Schedule schedule);
	
	/**
	 * 
	 * @return
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
	 */
	List<Schedule> getAllSchedules();
	
	/**
<<<<<<< HEAD
	 * 스케줄코드를 전달받아 해당하는 상영정보를 반환한다.
	 * @param scheduleCode 스케줄코드
	 * @return 해당하는 상영정보
=======
	 * 
	 * @param scheduleCode
	 * @return
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
	 */
	Schedule getScheduleByCode(String scheduleCode);
}
