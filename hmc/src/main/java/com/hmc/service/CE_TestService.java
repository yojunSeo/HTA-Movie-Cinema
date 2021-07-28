package com.hmc.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.hmc.vo.Booking;
import com.hmc.vo.Payment;
import com.hmc.vo.Room;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.Seat;

public interface CE_TestService {

	List<ScreenMovie> getAllScreenMovies();
	
	List<Room> getBrachRooms(String branchCode);

	void createSchedule(Schedule schedule);
	
	List<Map<String, Object>> getAllSchedule();
	
	Date getEndTime(Map<String, Object> condition);
	
	ScreenMovie getScreenMovieByCode(String screenCode);

	Map<String, Object> getScheduleByCode(String scheduleCode);
	
	List<Map<String, Object>> getMyBookingList(String userId);

	List<Seat> getSeats(Map<String, Object> condition);
	
	Map<String, Object> getSeatByCode(String seatCode);
	
	void insertPayment(Payment payment);
	
	void insertBooking(Booking booking);
}
