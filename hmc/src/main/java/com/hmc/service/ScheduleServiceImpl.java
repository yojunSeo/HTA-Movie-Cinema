package com.hmc.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.MovieDao;
import com.hmc.dao.RoomDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.vo.Branch;
import com.hmc.vo.Movie;
import com.hmc.vo.Room;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScheduleDetail;
import com.hmc.vo.ScreenMovie;
@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private MovieDao movieDao;
	@Autowired
	private ScreenMovieDao screenDao;
	@Autowired
	private BranchDao branchDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public List<Movie> getAllNonScreeMovies() {
		return movieDao.getAllNonScreenMovie();
	}
	
	@Override
	public List<ScreenMovie> getAllScreenMovies() {
		return screenDao.getAllScreenMovies();
	}
	
	@Override
	public Movie getMovieInfoByCode(String movieCode) {
		return movieDao.getMovieInfoByCode(movieCode);
	}
	
	@Override
	public void insertScreenMovie(ScreenMovie screenMovie) {
		screenDao.insertScreenMovie(screenMovie);
	}
	
	@Override
	public ScreenMovie getScreenMovieByCode(String screenCode) {
		return screenDao.getScreenMovieByCode(screenCode);
	}
	
	@Override
	public List<Branch> getAllBranchs() {
		return branchDao.getAllBranchs();
	}
	
	@Override
	public List<Room> getRoomsByBranchCode(String branchCode) {
		return roomDao.getRoomsByBranchCode(branchCode);
	}
	
	@Override
	public List<ScheduleDetail> getAllSchedules() {
		return scheduleDao.getAllSchedules();
	}
	
	@Override
	public Date getEndTime(Map<String, Object> condition) {
		return scheduleDao.getEndTime(condition);
	}
	
	@Override
	public List<ScheduleDetail> getBranchSchedulesByDate(Map<String, Object> condition) {
		return scheduleDao.getBranchSchedulesByDate(condition);
	}
	
	@Override
	public String getBranchNameByCode(String branchCode) {
		return branchDao.getBranchNameByCode(branchCode);
	}
	
	@Override
	public Room getRoomByCode(String roomCode) {
		return roomDao.getRoomByCode(roomCode);
	}
	
	@Override
	public void insertSchedule(Schedule schedule) {
		scheduleDao.insertSchedule(schedule);
	}
	
	@Override
	public int getAllSchedulesCnt(Map<String, Object> condition) {
		return scheduleDao.getAllSchedulesCnt(condition);
	}
	
	@Override
	public List<ScheduleDetail> getSchedules(Map<String, Object> condition) {
		return scheduleDao.getSchedules(condition);
	}
	
	@Override
	public List<ScreenMovie> getScreenMovies(Map<String, Object> condition) {
		return screenDao.getScreenMovies(condition);
	}
	
	@Override
	public int getScreenMoviesCnt() {
		return screenDao.getScreenMoviesCnt();
	}
}
