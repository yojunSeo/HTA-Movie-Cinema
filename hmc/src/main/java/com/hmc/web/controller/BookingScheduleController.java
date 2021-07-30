package com.hmc.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hmc.service.AdminScheduleService;
import com.hmc.service.ScheduleService;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/booking/schedule")
public class BookingScheduleController {

	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/")
	public String scheduleHome() {
		User user = scheduleService.getUserById("lim");
		SessionUtils.addAttribute("LOGINED_USER", user);
		return "booking/schedule";
	}

}
