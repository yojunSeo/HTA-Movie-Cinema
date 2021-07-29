package com.hmc.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.service.ScheduleService;

@Controller
@RequestMapping("/booking/schedule")
public class ScreeningScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/")
	public String scheduleConfirm() {
		return "booking/schedule";
	}
}
