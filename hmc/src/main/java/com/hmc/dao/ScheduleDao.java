package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Schedule;

public interface ScheduleDao {

	/**
<<<<<<< HEAD
<<<<<<< HEAD
	 * 상영스케줄 정보를 전달받아서 데이터베이스에 저장한다.
=======
	 * 
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
=======
	 * 
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
	 * @param schedule
	 */
	void insertSchedule(Schedule schedule);
	
	/**
<<<<<<< HEAD
<<<<<<< HEAD
	 * 상영스케줄 정보를 변경한다.
	 * @param schedule 변경된 정보가 담긴 Schedule객체
=======
	 * 
	 * @param schedule
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
=======
	 * 
	 * @param schedule
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
	 */
	void updateSchedule(Schedule schedule);
	
	/**
<<<<<<< HEAD
<<<<<<< HEAD
	 * 스케쥴코드를 전달받아서 상영스케줄을 삭제한다
	 * @param scheduleId 삭제할 스케쥴 코드
	 */
	void deleteSchedule(String scheduleCode);
	
	/**
	 * 모든 상영스케줄을 출력한다.
	 * @return 모든 상영스케줄
=======
=======
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
	 * 
	 * @param schedule
	 */
	void deleteSchedule(Schedule schedule);
	
	/**
	 * 
	 * @return
<<<<<<< HEAD
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
=======
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
	 */
	List<Schedule> getAllSchedules();
	
	/**
<<<<<<< HEAD
<<<<<<< HEAD
	 * 스케줄코드를 전달받아 해당하는 상영정보를 반환한다.
	 * @param scheduleCode 스케줄코드
	 * @return 해당하는 상영정보
=======
	 * 
	 * @param scheduleCode
	 * @return
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
=======
	 * 
	 * @param scheduleCode
	 * @return
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
	 */
	Schedule getScheduleByCode(String scheduleCode);
}
