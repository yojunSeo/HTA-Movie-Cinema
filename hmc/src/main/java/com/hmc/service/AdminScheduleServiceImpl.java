package com.hmc.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hmc.dao.BranchDao;
import com.hmc.dao.MovieDao;
import com.hmc.dao.RoomDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.Movie;
import com.hmc.vo.Pagination;
import com.hmc.vo.Room;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScreenMovie;
import com.hmc.web.form.ScheduleForm;
import com.hmc.web.util.DateUtils;
@Service
@Transactional
public class AdminScheduleServiceImpl implements AdminScheduleService{
	
	private static final int ROWS_PER_PAGE = 10;
	private static final int PAGE_PER_PAGE_BLOCK = 5;
	
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
	public void deleteScreenMovie(String screenCode) {
		screenDao.deleteScreenMovie(screenCode);
	}
	
	@Override
	public void updateScreenMovieEndTime(String screenCode, String endDate) throws ParseException {
		Date screenEndDate = DateUtils.stringToDate(endDate);
		ScreenMovie screenMovie = screenDao.getScreenMovieByCode(screenCode);
		screenMovie.setEndDate(screenEndDate);
		screenDao.updateScreenMovie(screenMovie);
	}

	@Override
	public List<ScreenMovie> getAllScreenMovies() {
		return screenDao.getAllScreenMovies();
	}
	
	@Override
	public void deleteSchedule(String scheduleCode) {
		scheduleDao.deleteSchedule(scheduleCode);
	}
	
	@Override
	public Movie getMovieInfoByCode(String movieCode) {
		return movieDao.getMovieInfoByCode(movieCode);
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
	public String getBranchNameByCode(String branchCode) {
		return branchDao.getBranchNameByCode(branchCode);
	}
	
	@Override
	public List<ScreenMovie> getScreenMovies(Map<String, Object> condition) {
		return screenDao.getScreenMovies(condition);
	}
	
	@Override
	public Map<String, Object> searchSchedule(Map<String, Object> param) {
		int pageNo = Integer.parseInt(param.get("pageNo").toString());
		// 해당 페이지에 해당하는 스케줄 조회
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		List<ScheduleDetail> schedules = scheduleDao.getSchedules(param);
		// 페이징 처리
		// 총 행의 갯수 구하기
		int totalRows = scheduleDao.getAllSchedulesCnt(param);
		System.out.println(totalRows);
		// 총 페이지 갯수 구하기
		int totalPages = (int)Math.ceil((double)totalRows/ROWS_PER_PAGE);
		// 총 페이지 블록갯수 
		int totalBlocks = (int)Math.ceil((double)totalPages/PAGE_PER_PAGE_BLOCK);
		// 요청한 페이지번호가 속하는 페이지 블록 계산
		int currentBlock = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		// 현재 페이지 블록의 시작과 끝 페이지 번호계산
		int beginPage = (currentBlock-1)*PAGE_PER_PAGE_BLOCK + 1;
		int endPage = currentBlock*PAGE_PER_PAGE_BLOCK;
		if(currentBlock == totalBlocks) {
			endPage = totalPages;
		}
		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage);
		pagination.setCurrentPageBlock(currentBlock);
		pagination.setEndPage(endPage);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks);
		pagination.setTotalPages(totalPages);
		pagination.setTotalRows(totalRows);
		
		List<Branch> branchs = branchDao.getAllBranchs();
		List<ScreenMovie> movies = screenDao.getAllScreenMovies();
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("branchs", branchs);
		result.put("schedules", schedules);
		result.put("movies", movies);
		result.put("pagination", pagination);
		return result;
	}
	
	@Override
	public Map<String, Object> screenMovieList(int pageNo) {
		List<Movie> nonScreenMovies = movieDao.getAllNonScreenMovie();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		List<ScreenMovie> screenMovies = screenDao.getScreenMovies(param);
		
		int totalRows = screenDao.getScreenMoviesCnt();
		int totalPages = (int)Math.ceil((double)totalRows/ROWS_PER_PAGE);
		int totalBlocks = (int)Math.ceil((double)totalPages/PAGE_PER_PAGE_BLOCK);
		int currentBlock = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		int beginPage = (currentBlock-1)*PAGE_PER_PAGE_BLOCK +1; 
		int endPage = currentBlock*PAGE_PER_PAGE_BLOCK;
		if(currentBlock == totalBlocks) {
			endPage = totalPages;
		}

		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage);
		pagination.setCurrentPageBlock(currentBlock);
		pagination.setEndPage(endPage);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks);
		pagination.setTotalPages(totalPages);
		pagination.setTotalRows(totalRows);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pagination", pagination);
		result.put("movies", nonScreenMovies);
		result.put("screens", screenMovies);
		return result;
	}
	
	@Override
	public Map<String, Object> scheduleListPagination(int pageNo) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		// 해당 페이지에 해당하는 스케줄 조회
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		List<ScheduleDetail> schedules = scheduleDao.getSchedules(param);
		
		// 페이징 처리
		// 총 행의 갯수 구하기
		int totalRows = scheduleDao.getAllSchedulesCnt(param);
		// 총 페이지 갯수 구하기
		int totalPages = (int)Math.ceil((double)totalRows/ROWS_PER_PAGE);
		// 총 페이지 블록갯수 
		int totalBlocks = (int)Math.ceil((double)totalPages/PAGE_PER_PAGE_BLOCK);
		// 요청한 페이지번호가 속하는 페이지 블록 계산
		int currentBlock = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		// 현재 페이지 블록의 시작과 끝 페이지 번호계산
		int beginPage = (currentBlock-1)*PAGE_PER_PAGE_BLOCK + 1;
		int endPage = currentBlock*PAGE_PER_PAGE_BLOCK;
		if(currentBlock == totalBlocks) {
			endPage = totalPages;
		}
		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage);
		pagination.setCurrentPageBlock(currentBlock);
		pagination.setEndPage(endPage);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks);
		pagination.setTotalPages(totalPages);
		pagination.setTotalRows(totalRows);
		
		List<Branch> branchs = branchDao.getAllBranchs();
		List<ScreenMovie> movies = screenDao.getAllScreenMovies();
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("branchs", branchs);
		result.put("schedules", schedules);
		result.put("movies", movies);
		result.put("pagination", pagination);
		return result;
	}
	
	@Override
	public ScreenMovie screenRegisterAndGetScreenMovie(ScreenMovie screenMovie) {
		Movie movie = movieDao.getMovieInfoByCode(screenMovie.getMovieCode());
		screenMovie.setMovieName(movie.getMovieName());
		screenMovie.setRunningTime(movie.getRunningTime());
		screenDao.insertScreenMovie(screenMovie);
		ScreenMovie screen = screenDao.getScreenMovieByCode(screenMovie.getCode());
		return screen;
	}
	
	@Override
	public String getEndTime(String startTime, String screenCode) throws ParseException {
		Date start = DateUtils.stringToDateTime(startTime);
		String startTimeString = DateUtils.dateToSqlDateString(start);
		ScreenMovie movie = screenDao.getScreenMovieByCode(screenCode);
		
		Map<String, Object> timeCondition = new HashMap<String, Object>();
		timeCondition.put("startTime", startTimeString);
		timeCondition.put("runningTime", movie.getRunningTime());
		
		Date endTime = scheduleDao.getEndTime(timeCondition);
		String endTimeString = DateUtils.dateToDateTimeString(endTime);
		return endTimeString;
	}
	
	@Override
	public List<ScheduleDetail> getBranchSchedule(String branchCode, String screenDate) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", branchCode);
		condition.put("screenDate", screenDate);
		List<ScheduleDetail> schedules = scheduleDao.getBranchSchedulesByDate(condition);
		return schedules;
	}
	
	@Override
	public List<String> scheduleRegisterAndGetScheduleInfo(ScheduleForm scheduleForm) throws ParseException {
		List<String> startTimes = scheduleForm.getStartTime();
		List<String> endTimes = scheduleForm.getEndTime();
		List<Date> startTimeDates = new ArrayList<Date>();
		List<Date> endTimeDates = new ArrayList<Date>();
		
		for(String startTime : startTimes) {
			Date startTimeDate = DateUtils.stringToDateTime(startTime);
			startTimeDates.add(startTimeDate);
		}
		for(String endTime : endTimes) {
			Date endTimeDate = DateUtils.stringToDateTime(endTime);
			endTimeDates.add(endTimeDate);
		}
		
		int totalSeat = roomDao.getRoomByCode(scheduleForm.getRoomCode()).getTotalSeat();
		// 인서트 여러번 수행하기
		for(int i=0; i<endTimes.size(); i++) {
			Schedule schedule = new Schedule();
			schedule.setBranchCode(scheduleForm.getBranchCode());
			schedule.setRoomCode(scheduleForm.getRoomCode());
			schedule.setScheduleDate(scheduleForm.getScheduleDate());
			schedule.setScreenCode(scheduleForm.getScreenCode());
			schedule.setStartTime(startTimeDates.get(i));
			schedule.setEndTime(endTimeDates.get(i));
			schedule.setEmptySeat(totalSeat);
			schedule.setTotalSeat(totalSeat);
			scheduleDao.insertSchedule(schedule);
		}
		List<String> info = new ArrayList<String>();
		info.add(scheduleForm.getBranchCode());
		info.add(DateUtils.dateToDateString(scheduleForm.getScheduleDate()));
		return info;
	}
	
	@Override
	public List<String> getScreenMovieWithoutSchedule() {
		return screenDao.getScreenMovieWithoutSchedule();
	}
}
