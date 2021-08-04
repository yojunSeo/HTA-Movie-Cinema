package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.dto.BranchScheduleDto;
import com.hmc.dto.MovieScheduleDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.Room;
import com.hmc.vo.Seat;
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
	
	// 스케줄 코드를 받아서예매된 좌석정보들을 가지고 오는 서비스
	List<Map<String, Object>> getBookingSeat(String scheduleCode);
	
	// 룸코드를 받아서 해당하는 좌석정보들을 반환한다.
	List<Map<String, Object>> getRoomSeat(String roomCode);
	
	Map<String, Object> getSeatByCode(String seatCode);
}
