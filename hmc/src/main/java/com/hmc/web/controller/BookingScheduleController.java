package com.hmc.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hmc.service.AdminScheduleService;
import com.hmc.vo.Branch;

@RestController
@RequestMapping("/booking/schedule")
public class BookingScheduleController {

	@Autowired
	private AdminScheduleService scheduleService;
	
	@GetMapping("/")
	public String scheduleConfirm(Model model) {
		// 모든 상영관 조회해서 담기
		List<Branch> branchs = scheduleService.getAllBranchs(); 
		// 사용자의 선호영화관 담기
		//List
		return "booking/schedule";
	}
}
