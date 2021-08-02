package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.hmc.dto.MovieScheduleDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.service.AdminScheduleService;
import com.hmc.service.ScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.User;
import com.hmc.web.util.DateUtils;
import com.hmc.web.util.SessionUtils;

@RestController
@RequestMapping("/booking/schedule/rest")
public class BookingScheduleRestController {

	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private AdminScheduleService adminScheduleService;

	@GetMapping("/branch/info")
	public ResponseEntity<Map<String, Object>> branchSheduleinfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		// 모든 상영관 조회해서 담기
		List<Branch> branchs = scheduleService.getAllBranchs(); 
		param.put("allBranchs", branchs);
		
		// 디폴트 값들 정하기
		String defaultBranch = branchs.get(0).getCode();
		String defaultArea = "서울";
		
		// 로그인 여부 확인
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		if(user == null) {
			// 로그인 안된경우 : favoritebranchs에 false
			param.put("favoriteBranchs", false);
		}else {
			// 로그인 된 경우 - 선호 영화관 있는경우 없는경우 나눈다.
			List<Branch> favoritebranchs = scheduleService.getUserFavoriteBranchs(user);
			if(favoritebranchs.size() == 0) {
				// 선호 영화관 없는 경우
				param.put("favoriteBranchs", false);
			}else {
				// 선호 영화관 있는 경우
				param.put("favoriteBranchs", favoritebranchs);
				defaultArea = "MY 영화관";
				defaultBranch = favoritebranchs.get(0).getCode();
			}
		}
		param.put("defaultArea", defaultArea);
		param.put("defaultBranch", defaultBranch);
		// 디폴트 영화관의 오늘 상영스케줄 담기 // 영화별로 정렬
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", defaultBranch);
		condition.put("screenDate", DateUtils.dateToDateString(new Date()));
		BranchScheduleDto branchSchedules = scheduleService.getBranchScheduleByOrderMovie(condition);
		System.out.println(branchSchedules);
		param.put("schedules", branchSchedules);
		// 사용자의 선호영화관 담기
		return new ResponseEntity<Map<String,Object>>(param, HttpStatus.OK);
	}
	
	@GetMapping("/branch/areaBranch")
	public ResponseEntity<List<Branch>> areaBranch(@RequestParam("area") String area){
		System.out.println(area);
		List<Branch> branchs = new ArrayList<Branch>();
		if("서울".equals(area)) {
			branchs = scheduleService.getAllBranchs();
		}else {
			// my영화관 선택한경우
			User user = (User)SessionUtils.getAttribute("LOGINED_USER");
			List<Branch> myBranchs = scheduleService.getUserFavoriteBranchs(user);
			// 로그인 안했거나 my영화관이 없는경우
			if(user != null || myBranchs.size()!=0) {
				branchs = myBranchs;
				
			}		
		}
		return new ResponseEntity<List<Branch>>(branchs, HttpStatus.OK);
	}
	
	@GetMapping("/branch/getMovieSchedule")
	public ResponseEntity<List<MovieDto>> getMovieSchedule(@RequestParam("branchCode")String branchCode, 
																@RequestParam("screenDate") String screenDate){
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", branchCode);
		condition.put("screenDate", screenDate);
		BranchScheduleDto bsd = scheduleService.getBranchScheduleByOrderMovie(condition);
		List<MovieDto> movies = new ArrayList<MovieDto>();
		if(bsd != null) {
			movies = bsd.getMovies();
		}
		return new ResponseEntity<List<MovieDto>>(movies,HttpStatus.OK);
	}
	
	@GetMapping("/movie/info")
	public ResponseEntity<Map<String, Object>> movieSheduleinfo(){
		Map<String, Object> info = new HashMap<String, Object>();
		List<Map<String, Object>> movies = scheduleService.getScreenSimpleInfo();
		info.put("movies", movies);
		Map<String, Object> defaultMovie = movies.get(0);
		info.put("defaultMovie", defaultMovie);		
		return new ResponseEntity<Map<String,Object>>(info,HttpStatus.OK);
	}
	
	@GetMapping("/movie/getBranchSchedule")
	public ResponseEntity<List<BranchDto>> getBranchSchedule(@RequestParam("screenCode")String screenCode,
													@RequestParam("screenDate")String screenDate){
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("screenCode", screenCode);
		condition.put("screenDate", screenDate);
		MovieScheduleDto msd = scheduleService.getMoiveSchedulesByBranch(condition);
		List<BranchDto> branchs = new ArrayList<BranchDto>();
		if(msd != null) {
			branchs =msd.getBranchs();
		}
		return new ResponseEntity<List<BranchDto>>(branchs, HttpStatus.OK);
	}
	
	@GetMapping("/scheduleDetail")
	public ResponseEntity<ScheduleDetail> getscheduleDetail(@RequestParam("scheduleCode")String scheduleCode){
		ScheduleDetail schedule = scheduleService.getScheduleDetail(scheduleCode);
		return new ResponseEntity<ScheduleDetail>(schedule,HttpStatus.OK);
	}

}
