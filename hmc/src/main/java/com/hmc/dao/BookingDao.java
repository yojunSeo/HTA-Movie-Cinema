package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Booking;

public interface BookingDao {

	/**
	 * 예매정보를 데이터베이스에 저장한다.
	 * @param booking 저장할 예매정보
	 */
	void insertBooking(Booking booking);
	
	/**
	 * 예매정보를 수정한다.
	 * @param booking 수정된 정보가 포함된 Booking객체
	 */
	void updateBooking(Booking booking);
	
	/**
	 * 사용자 아이디를 전달받아서 사용자의 예매내역을 반환한다.
	 * @param userId 사용자아이디
	 * @return 사용자의 예매내역
	 */
	List<Booking> getBookingsByUserId(String userId);
	
	/**
	 * 예매코드를 전달받아서 해당하는 예매정보를 반환한다.
	 * @param bookingCode 예매코드
	 * @return 해당하는 예매정보
	 */
	Booking getBookingByCode(String bookingCode);
}
