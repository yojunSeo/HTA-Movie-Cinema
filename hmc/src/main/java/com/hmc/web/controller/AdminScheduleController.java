package com.hmc.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.service.ScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.Movie;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScheduleDetail;
import com.hmc.vo.ScreenMovie;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/screen/list")
	public String screenMovieList(Model model) {
		
		List<Movie> nonScreenMovies = scheduleService.getAllNonScreeMovies();
		List<ScreenMovie> screenMovies = scheduleService.getAllScreenMovies();
		
		model.addAttribute("movies", nonScreenMovies);
		model.addAttribute("screens", screenMovies);
		
		return "admin/schedule/screen";
	}
	
	@GetMapping("/list")
	public String scheduleList(Model model) {
		List<Branch> branchs = scheduleService.getAllBranchs();
		List<ScheduleDetail> schedules = scheduleService.getAllSchedules();
		List<ScreenMovie> movies = scheduleService.getAllScreenMovies();
		model.addAttribute("branchs", branchs);
		model.addAttribute("schedules", schedules);
		model.addAttribute("movies", movies);
		return "admin/schedule/list";
	}
	
	@GetMapping("/register")
	public String scheduleRegisterForm(Model model) {
		List<Branch> branchs = scheduleService.getAllBranchs();
		List<ScreenMovie> movies = scheduleService.getAllScreenMovies();
		model.addAttribute("branchs", branchs);
		model.addAttribute("movies", movies);
		return "admin/schedule/register";
	}
	
	@PostMapping("/register")
	public String scheduleRegister(Schedule schedule) {
		return "redirect:list";
	}
}
