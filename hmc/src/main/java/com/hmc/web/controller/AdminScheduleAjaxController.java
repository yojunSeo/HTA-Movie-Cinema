package com.hmc.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.dto.ScheduleDetail;
import com.hmc.service.AdminScheduleService;
import com.hmc.vo.Movie;
import com.hmc.vo.Room;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScreenMovie;
import com.hmc.web.form.ScheduleForm;
import com.hmc.web.util.DateUtils;

@Controller
@RequestMapping("/admin/rest")
public class AdminScheduleAjaxController {
	
	@Autowired
	private AdminScheduleService scheduleService;
	
	@RequestMapping("/screen/movie")
	public @ResponseBody ResponseEntity<Movie> movieInfo(@RequestParam("code") String movieCode){
		Movie movie = scheduleService.getMovieInfoByCode(movieCode);
		if(movie == null) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Movie>(movie, HttpStatus.OK);
	}
	
	@RequestMapping("/screen/register")
	public @ResponseBody ResponseEntity<ScreenMovie> screenRegister(ScreenMovie screenMovie){
		Movie movie = scheduleService.getMovieInfoByCode(screenMovie.getMovieCode());
		screenMovie.setMovieName(movie.getMovieName());
		screenMovie.setRunningTime(movie.getRunningTime());
		scheduleService.insertScreenMovie(screenMovie);
		ScreenMovie screen = scheduleService.getScreenMovieByCode(screenMovie.getCode());
		return new ResponseEntity<ScreenMovie>(screen, HttpStatus.OK);
	}
	
	@RequestMapping("/branch")
	public @ResponseBody ResponseEntity<List<Room>> branchRooms(@RequestParam("code") String branchCode){
		List<Room> rooms = scheduleService.getRoomsByBranchCode(branchCode);
		if(rooms.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Room>>(rooms, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/screenDate", produces = "text/plain")
	public @ResponseBody ResponseEntity<String> screenDate(@RequestParam("date") String screen) throws ParseException{
		Date screenDate = DateUtils.stringToDate(screen);

		String startTime = DateUtils.dateToDateTimeString(screenDate);

		return new ResponseEntity<String>(startTime, HttpStatus.OK);
	}
	
	@RequestMapping(path =  "/endTime", produces = "text/plain")
	public @ResponseBody ResponseEntity<String> endTime(@RequestParam("startTime") String start, @RequestParam("movieCode") String screenCode) throws ParseException{
		Date startTime = DateUtils.stringToDateTime(start);;
		String startTimeString = DateUtils.dateToSqlDateString(startTime);
		ScreenMovie movie = scheduleService.getScreenMovieByCode(screenCode);
		
		Map<String, Object> timeCondition = new HashMap<String, Object>();
		timeCondition.put("startTime", startTimeString);
		timeCondition.put("runningTime", movie.getRunningTime());
		
		Date endTime = scheduleService.getEndTime(timeCondition);
		String endTimeString = DateUtils.dateToDateTimeString(endTime);
		return new ResponseEntity<String>(endTimeString, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/branchName", produces = "text/plain; charset=utf-8" )
	public @ResponseBody ResponseEntity<String> branchName(@RequestParam("code") String branchCode){
		String branchName = scheduleService.getBranchNameByCode(branchCode);
		return new ResponseEntity<String>(branchName, HttpStatus.OK);
	}
	
	
	@RequestMapping("/branchSchedule")
	public @ResponseBody ResponseEntity<List<ScheduleDetail>> branchSchedule(
					@RequestParam("branchCode") String branchCode, @RequestParam("screenDate") String screenDate){
		
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", branchCode);
		condition.put("screenDate", screenDate);
		List<ScheduleDetail> schedules = scheduleService.getBranchSchedulesByDate(condition);
		return new ResponseEntity<List<ScheduleDetail>>(schedules, HttpStatus.OK);
	}
	
	@RequestMapping("/schedule/register")
	public @ResponseBody ResponseEntity<List<String>> scheduleRegister(ScheduleForm scheduleForm) throws ParseException{
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
		
		int totalSeat = scheduleService.getRoomByCode(scheduleForm.getRoomCode()).getTotalSeat();
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
			scheduleService.insertSchedule(schedule);
		}
		List<String> info = new ArrayList<String>();
		info.add(scheduleForm.getBranchCode());
		info.add(DateUtils.dateToDateString(scheduleForm.getScheduleDate()));
		return new ResponseEntity<List<String>>(info, HttpStatus.OK);
	}


}
