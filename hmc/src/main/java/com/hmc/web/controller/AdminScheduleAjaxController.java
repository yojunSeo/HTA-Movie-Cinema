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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.service.ScheduleService;
import com.hmc.vo.Movie;
import com.hmc.vo.Room;
import com.hmc.vo.ScreenMovie;

@Controller
@RequestMapping("/admin/rest")
public class AdminScheduleAjaxController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	private static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	private static SimpleDateFormat TIME_FORMAT = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	
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
		System.out.println(screen);
		return new ResponseEntity<ScreenMovie>(screen, HttpStatus.OK);
	}
	
	@RequestMapping("/branch")
	public @ResponseBody ResponseEntity<List<Room>> branchRooms(@RequestParam("code") String branchCode){
		List<Room> rooms = scheduleService.getRoomsByBranchCode(branchCode);
		if(rooms.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		System.out.println(rooms);
		return new ResponseEntity<List<Room>>(rooms, HttpStatus.OK);
	}
	
	@RequestMapping(path = "/screenDate", produces = "text/plain")
	public @ResponseBody ResponseEntity<String> screenDate(@RequestParam("date") String screen) throws ParseException{
		Date screenDate = DATE_FORMAT.parse(screen);

		String startTime = DATE_TIME_FORMAT.format(screenDate);

		return new ResponseEntity<String>(startTime, HttpStatus.OK);
	}
	
	@RequestMapping(path =  "/endTime", produces = "text/plain")
	public @ResponseBody ResponseEntity<String> endTime(@RequestParam("startTime") String start, @RequestParam("movieCode") String screenCode) throws ParseException{
		Date startTime = DATE_TIME_FORMAT.parse(start);
		String startTimeString = TIME_FORMAT.format(startTime);
		ScreenMovie movie = scheduleService.getScreenMovieByCode(screenCode);
		
		Map<String, Object> timeCondition = new HashMap<String, Object>();
		timeCondition.put("startTime", startTimeString);
		timeCondition.put("runningTime", movie.getRunningTime());
		
		Date endTime = scheduleService.getEndTime(timeCondition);
		String endTimeString = DATE_TIME_FORMAT.format(endTime);
		System.out.println(endTimeString);
		
		return new ResponseEntity<String>(endTimeString, HttpStatus.OK);
	}
	
	@RequestMapping("/branchSchedule")
	public @ResponseBody ResponseEntity<List<Map<String, Object>>> branchSchedule(
					@RequestParam("branchCode") String branchCode, @RequestParam("screenDate") String screenDate){
		
		System.out.println(branchCode);
		System.out.println(screenDate);
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", branchCode);
		condition.put("screenDate", screenDate);
		List<Map<String, Object>> schedules = scheduleService.getBranchSchedulesByDate(condition);
		if(schedules.isEmpty()) {
			String branchName = scheduleService.getBranchNameByCode(branchCode);
			Map<String, Object> branchInfo = new HashMap<String, Object>();
			branchInfo.put("branchName", branchName);
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			list.add(branchInfo);
			return new ResponseEntity<List<Map<String,Object>>>(list, HttpStatus.OK);
		}
		return new ResponseEntity<List<Map<String,Object>>>(schedules, HttpStatus.OK);
	}


}
