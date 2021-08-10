package com.hmc.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.dto.BranchDto;
import com.hmc.dto.BranchScheduleDto;
import com.hmc.dto.MovieDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.service.ScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.ScreenMovie;

@RestController
@RequestMapping("/booking/schedule/rest")
public class BookingScheduleRestController {

	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("/branch/info")
	public ResponseEntity<Map<String, Object>> branchSheduleinfo() {
		Map<String, Object> param = scheduleService.branchSheduleinfo();
		return new ResponseEntity<Map<String,Object>>(param, HttpStatus.OK);
	}
	
	@GetMapping("/branch/areaBranch")
	public ResponseEntity<List<Branch>> areaBranch(@RequestParam("area") String area){
		List<Branch> branchs = scheduleService.getAreaBranch(area);
		return new ResponseEntity<List<Branch>>(branchs, HttpStatus.OK);
	}
	
	@GetMapping("/branch/getMovieSchedule")
	public ResponseEntity<List<MovieDto>> getMovieSchedule(@RequestParam("branchCode")String branchCode, 
																@RequestParam("screenDate") String screenDate){
		List<MovieDto> movies = scheduleService.getMovieSchedule(branchCode, screenDate);
		return new ResponseEntity<List<MovieDto>>(movies,HttpStatus.OK);
	}
	
	@GetMapping("/movie/info")
	public ResponseEntity<Map<String, Object>> movieSheduleinfo(){
		Map<String, Object> info = scheduleService.getMovieSheduleinfo();	
		return new ResponseEntity<Map<String,Object>>(info,HttpStatus.OK);
	}
	
	@GetMapping("/movie/getBranchSchedule")
	public ResponseEntity<List<BranchDto>> getBranchSchedule(@RequestParam("screenCode")String screenCode,
													@RequestParam("screenDate")String screenDate){
		List<BranchDto> branchs = scheduleService.getBranchSchedule(screenCode, screenDate);
		return new ResponseEntity<List<BranchDto>>(branchs, HttpStatus.OK);
	}
	
	@GetMapping("/scheduleDetail")
	public ResponseEntity<ScheduleDetail> getscheduleDetail(@RequestParam("scheduleCode")String scheduleCode){
		ScheduleDetail schedule = scheduleService.getScheduleDetail(scheduleCode);
		return new ResponseEntity<ScheduleDetail>(schedule,HttpStatus.OK);
	}
	
	@GetMapping("/branch/screenMovie")
	public List<Map<String, Object>> getBranchScreenMovies(@RequestParam("branch")String branchCode){
		List<Map<String, Object>> movies = scheduleService.getBranchMovies(branchCode);
		return movies;
	}
	
	@GetMapping("/schedule")
	public BranchScheduleDto getSchedules(@RequestParam("branch")String branchCode, @RequestParam("screenDate")String screenDate,
																	@RequestParam("screenMovie")String screenMovie){
		BranchScheduleDto schedules = new BranchScheduleDto();
		BranchScheduleDto bschedules = scheduleService.getSchedules(branchCode, screenMovie, screenDate);
		if(bschedules != null) {
			schedules = bschedules;
		}
		return schedules;
	}

}
