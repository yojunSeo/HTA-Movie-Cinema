package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Seat;
import com.hmc.vo.SeatBooking;
import com.hmc.vo.SeatType;

public interface SeatDao {
	
	/**
	 * 모든 좌석타입을 반환한다.
	 * @return 모든 좌석타입
	 */
	List<SeatType> getAllSeatTypes();
	
	/**
	 * 영화관코드와 상영관코드를 전달받아서 좌석을 반환한다.
	 * @param condition 영화관코드와 상영관 코드
	 * @return 해당하는 좌석 목록
	 */
	List<Seat> getSeats(Map<String, Object> condition);
	
	/**
	 * 
	 * @param seatBooking
	 */
	void insertSeatBooking(SeatBooking seatBooking);
	
	/**
	 * 예매코드를 전달받아서 해당하는 좌석예매정보/정보들을 삭제한다.
	 * @param bookingCode 예매코드
	 */
	void deleteSeatBooking(String bookingCode);
	
	/**
	 * 스케줄코드를 전달받아서 그 스케줄에 예약된 좌석들을 반환한다.
	 * @param scheduleCod 스케줄 코드
	 * @return 예약된 좌석목록
	 */
	List<SeatBooking> getSeatBookingsBySchedule(String scheduleCode);
	
	/**
	 * 예매코드를 전달받아서 해당한 예약좌석을 반환한다.
	 * @param bookingCode 예매코드
	 * @return 해당하는 좌석예약정보
	 */
	SeatBooking getSeatBookingsByBooking(String bookingCode);
	
	Map<String, Object> getSeatByCode(String seatCode);
	
	List<Map<String, Object>> getRoomSeats(String roomCode);
}
