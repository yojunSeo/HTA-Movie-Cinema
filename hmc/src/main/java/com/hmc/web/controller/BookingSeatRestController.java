package com.hmc.web.controller;

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

import com.hmc.dto.ScheduleDetail;
import com.hmc.service.ScheduleService;

@RestController
@RequestMapping("/booking/seat/rest")
public class BookingSeatRestController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/info")
	public ResponseEntity<Map<String, Object>> seatInfo(@RequestParam("code") String scheduleCode){
		ScheduleDetail schedule = scheduleService.getScheduleDetail(scheduleCode);
		// 예매불가능한 좌석들을 받아온다
		List<Map<String, Object>> bookedSeats = scheduleService.getBookingSeat(scheduleCode);
		// 스케줄에 해당하는 상영관의 좌석정보를 받아온다.
		List<Map<String, Object>> roomSeats = scheduleService.getRoomSeat(schedule.getRoomCode());
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("bookedSeats", bookedSeats);
		result.put("roomSeats", roomSeats);
		return new ResponseEntity<Map<String, Object>>(result,HttpStatus.OK);
	}

}
