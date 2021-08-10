package com.hmc.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.AdminScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	@Autowired
	private AdminScheduleService scheduleService;
	
	@GetMapping("/screen/list")
	public String screenMovieList(@LoginAdmin User admin, @RequestParam(name = "page", required = false, defaultValue = "1")int pageNo, Model model) {
		
		Map<String, Object> result = scheduleService.screenMovieList(pageNo);
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("movies", result.get("movies"));
		model.addAttribute("screens", result.get("screens"));
		model.addAttribute("today", new Date());
		return "admin/schedule/screen";
	}
	
	@GetMapping("/register")
	public String scheduleRegisterForm(@LoginAdmin User admin, Model model) {
		List<Branch> branchs = scheduleService.getAllBranchs();
		List<ScreenMovie> movies = scheduleService.getAllScreenMovies();
		model.addAttribute("branchs", branchs);
		model.addAttribute("movies", movies);
		return "admin/schedule/register";
	}
	
	@GetMapping("/list")
	public String scheduleListPagination(@LoginAdmin User admin, @RequestParam(name = "page", required = false, defaultValue = "1") int pageNo,@RequestParam(name="branch", required = false) String branchCode, @RequestParam(name="room", required = false) String roomCode, 
			@RequestParam(name="movie", required = false) String screenCode, @RequestParam(name="screenDate", required = false) String screenDate, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pageNo", pageNo);
		if(branchCode != null) {
			param.put("branch", branchCode);			
		}
		if(roomCode != null) {
			param.put("room", roomCode);
		}
		if(screenCode != null) {
			param.put("screen", screenCode);
		}
		if(screenDate != "") {
			param.put("screenDate", screenDate);
		}
		Map<String, Object> result = scheduleService.searchSchedule(param);
		model.addAttribute("branchs", result.get("branchs"));
		model.addAttribute("schedules", result.get("schedules"));
		model.addAttribute("movies", result.get("movies"));
		model.addAttribute("pagination", result.get("pagination"));
		return "admin/schedule/list";
	}
	
	@GetMapping("/delete")
	public String deleteSchedule(@LoginAdmin User admin, @RequestParam("schedule")String scheduleCode) {
		scheduleService.deleteSchedule(scheduleCode);
		return "redirect:list";
	}
	

}
