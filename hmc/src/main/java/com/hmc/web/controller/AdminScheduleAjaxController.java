package com.hmc.web.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.dto.ScheduleDetail;
import com.hmc.service.AdminScheduleService;
import com.hmc.vo.Movie;
import com.hmc.vo.Room;
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
		ScreenMovie screen = scheduleService.screenRegisterAndGetScreenMovie(screenMovie);
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
		String endTimeString = scheduleService.getEndTime(start, screenCode);
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
		List<ScheduleDetail> schedules = scheduleService.getBranchSchedule(branchCode, screenDate);
		return new ResponseEntity<List<ScheduleDetail>>(schedules, HttpStatus.OK);
	}
	
	@RequestMapping("/schedule/register")
	public @ResponseBody ResponseEntity<List<String>> scheduleRegister(ScheduleForm scheduleForm) throws ParseException{
		List<String> info = scheduleService.scheduleRegisterAndGetScheduleInfo(scheduleForm);
		return new ResponseEntity<List<String>>(info, HttpStatus.OK);
	}
	
	@RequestMapping("/movie/delete")
	public @ResponseBody ResponseEntity<Void> deleteScreenMoive(@RequestParam("screenCode") String screenCode) {
		scheduleService.deleteScreenMovie(screenCode);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	@RequestMapping("/movie/update")
	public @ResponseBody ResponseEntity<Void> updateScreenMoive(@RequestParam("screenCode") String screenCode, @RequestParam("endDate") String endDate) throws ParseException {
		scheduleService.updateScreenMovieEndTime(screenCode, endDate);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@RequestMapping("/movie/isDeleteable")
	public @ResponseBody ResponseEntity<List<String>> isDeleteable(){
		List<String> withoutSchedulemovies = scheduleService.getScreenMovieWithoutSchedule();
		return new ResponseEntity<List<String>>(withoutSchedulemovies, HttpStatus.OK);
	}

}
