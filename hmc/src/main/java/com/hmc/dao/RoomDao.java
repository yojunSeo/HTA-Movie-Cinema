package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Room;

public interface RoomDao {

	/**
	 * 상영관의 상태를 변경한다.
	 * @param room 변경된 정보가 담겨있는 Room객체
	 */
	void updateRoom(Room room);
	
	/**
	 * 영화관코드를 전달받아서 해당영화관의 상영관들을 반환한다.
	 * @param branchCode 영화관 코드
	 * @return 그 영화관의 상영관 리스트
	 */
	List<Room> getRoomsByBranchCode(String branchCode);
	
	/**
	 * 상영관코드를 전달받아 상영관의 상세정보 반환
	 * @param roomCode 상영환코드
	 * @return 상영관 상세정보
	 */
	Room getRoomByCode(String roomCode);
}
