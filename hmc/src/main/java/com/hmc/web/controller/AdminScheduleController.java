package com.hmc.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.AdminScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.ScreenMovie;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	@Autowired
	private AdminScheduleService scheduleService;
	
	@GetMapping("/screen/list")
	public String screenMovieList(@RequestParam(name = "page", required = false, defaultValue = "1")int pageNo, Model model) {
		
		Map<String, Object> result = scheduleService.screenMovieList(pageNo);
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("movies", result.get("movies"));
		model.addAttribute("screens", result.get("screens"));
		
		return "admin/schedule/screen";
	}
	
	@GetMapping("/register")
	public String scheduleRegisterForm(Model model) {
		List<Branch> branchs = scheduleService.getAllBranchs();
		List<ScreenMovie> movies = scheduleService.getAllScreenMovies();
		model.addAttribute("branchs", branchs);
		model.addAttribute("movies", movies);
		return "admin/schedule/register";
	}
	
	@GetMapping("/list")
	public String scheduleListPagination(@RequestParam(name = "page", required = false, defaultValue = "1") int pageNo, Model model) {
		Map<String, Object> result =  scheduleService.scheduleListPagination(pageNo);
		model.addAttribute("branchs", result.get("branchs"));
		model.addAttribute("schedules", result.get("schedules"));
		model.addAttribute("movies", result.get("movies"));
		model.addAttribute("pagination", result.get("pagination"));
		return "admin/schedule/list";
	}
}
