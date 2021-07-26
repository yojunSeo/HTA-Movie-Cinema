package com.hmc.dao;

import com.hmc.vo.Booking;

public interface BookingDao {

	/**
	 * 커밋확인용
	 * @param booking
	 */
	void insertBooking(Booking booking);
}
