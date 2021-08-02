package com.hmc.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.dto.ScheduleDetail;
import com.hmc.service.AdminScheduleService;
import com.hmc.service.ScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/schedule/branch")
	public String branchSchedule() {
		User user = scheduleService.getUserById("lim");
		SessionUtils.addAttribute("LOGINED_USER", user);
		return "booking/branchschedule";
	}
	
	@GetMapping("/schedule/movie")
	public String movieSchedule() {
		return "booking/movieschedule";
	}
	
	@GetMapping("/seat")
	public String seatZone(@RequestParam("scheduleCode")String scheduleCode, Model model) {
		// 스케줄 코드를 가져와서 맞는 좌석창을 띄워주는 일을 수행해야함
		ScheduleDetail schedule = scheduleService.getScheduleDetail(scheduleCode);
		// 예매불가능한 좌석들을 받아온다
		List<Map<String, Object>> bookedSeats = scheduleService.getBookingSeat(scheduleCode);
		// 스케줄에 해당하는 상영관의 좌석정보를 받아온다.
		List<Map<String, Object>> roomSeats = scheduleService.getRoomSeat(schedule.getRoomCode());
		
		model.addAttribute("schedule", schedule);
		model.addAttribute("bookedSeats", bookedSeats);
		model.addAttribute("roomSeats", roomSeats);
		return "booking/seat";
	}

}
