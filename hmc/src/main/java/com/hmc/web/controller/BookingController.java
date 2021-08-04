package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.dto.ScheduleDetail;
import com.hmc.service.BookingService;
import com.hmc.service.ScheduleService;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private BookingService bookingServcie;
	
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
		model.addAttribute("schedule", schedule);

		return "booking/seat";
	}
	
	@GetMapping("/book")
	public String bookingPage(String code, String[] seats, Model model) {
		ScheduleDetail schedule = scheduleService.getScheduleDetail(code);
		List<String> seatNames = new ArrayList<String>();
		int totalPrice = 0;
		for(String s : seats) {
			Map<String, Object> seat = scheduleService.getSeatByCode(s);
			String seatName = seat.get("SEATROW").toString() +seat.get("SEATCOL").toString();
			seatNames.add(seatName);
			totalPrice += Integer.parseInt(seat.get("PRICE").toString());
		}
		User user = scheduleService.getUserById("lim");
		List<Map<String, Object>> coupon = bookingServcie.getAbleCouponByUserId(user.getId());

		// 그 사용자의 포인트와 쿠폰들 조회해서 같이 담음
		model.addAttribute("schedule",schedule);
		model.addAttribute("seatCnt",seats.length);
		model.addAttribute("seats",seatNames);
		model.addAttribute("price", totalPrice);
		model.addAttribute("coupons", coupon);
		model.addAttribute("user", user);
		return "booking/booking";
	}
	
	@GetMapping("/pay")
	public String naverPay() {
		return "booking/naverpay";
	}

}
