package com.hmc.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BookingDao;
import com.hmc.dao.PaymentDao;
import com.hmc.dao.RoomDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.dao.SeatDao;
import com.hmc.vo.Booking;
import com.hmc.vo.Payment;
import com.hmc.vo.Room;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScheduleDetail;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.Seat;

@Service
public class CE_TestServiceImpl implements CE_TestService{
	
	@Autowired
	private BookingDao bookingDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private ScreenMovieDao screenMovieDao;
	@Autowired
	private SeatDao seatDao;
	
	@Override
	public List<ScreenMovie> getAllScreenMovies() {
		return screenMovieDao.getAllScreenMovies();
	}
	
	@Override
	public List<Room> getBrachRooms(String branchCode) {
		return roomDao.getRoomsByBranchCode(branchCode);
}
	
	@Override
	public void createSchedule(Schedule schedule) {
		scheduleDao.insertSchedule(schedule);
	}
	
	@Override
	public List<ScheduleDetail> getAllSchedule() {
		return scheduleDao.getAllSchedules();
	}
	
	@Override
	public Date getEndTime(Map<String, Object> condition) {
		return scheduleDao.getEndTime(condition);
	}
	
	@Override
	public ScreenMovie getScreenMovieByCode(String screenCode) {
		return screenMovieDao.getScreenMovieByCode(screenCode);
	}
	
	@Override
	public List<Map<String, Object>> getMyBookingList(String userId) {
		return bookingDao.getBookingDetailsByUserId(userId);
	}
	
	@Override
	public ScheduleDetail getScheduleByCode(String scheduleCode) {
		return scheduleDao.getScheduleByCode(scheduleCode);
	}
	
	@Override
	public List<Seat> getSeats(Map<String, Object> condition) {
		return seatDao.getSeats(condition);
	}
	
	@Override
	public Map<String, Object> getSeatByCode(String seatCode) {
		return seatDao.getSeatByCode(seatCode);
	}
	
	@Override
	public void insertPayment(Payment payment) {
		paymentDao.insertPayment(payment);
	}
	
	@Override
	public void insertBooking(Booking booking) {
		bookingDao.insertBooking(booking);
	}
}
