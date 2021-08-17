package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.dto.BookingDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.service.BookingService;
import com.hmc.service.ScheduleService;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginUser;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private BookingService bookingServcie;
	

	@GetMapping("/schedule")
	public String allSchedule(Model model) {
		return "booking/totalschedule";
	}
	
	@GetMapping("/schedule/branch")
	public String branchSchedule() {
		return "booking/branchschedule";
	}
	
	@GetMapping("/schedule/movie")
	public String movieSchedule() {
		return "booking/movieschedule";
	}
	
	@GetMapping("/seat")
	public String seatZone(@RequestParam("scheduleCode")String scheduleCode,@LoginUser User user, Model model) {
		// 스케줄 코드를 가져와서 맞는 좌석창을 띄워주는 일을 수행해야함
		ScheduleDetail schedule = scheduleService.getScheduleDetail(scheduleCode);
		model.addAttribute("schedule", schedule);

		return "booking/seat";
	}
	
	@GetMapping("/book")
	public String bookingPage(String code, String[] seats,@LoginUser User user, Model model) {
		ScheduleDetail schedule = scheduleService.getScheduleDetail(code);
		List<String> seatNames = new ArrayList<String>();
		int totalPrice = 0;
		for(String s : seats) {
			Map<String, Object> seat = scheduleService.getSeatByCode(s);
			String seatName = seat.get("SEATROW").toString() +seat.get("SEATCOL").toString();
			seatNames.add(seatName);
			totalPrice += Integer.parseInt(seat.get("PRICE").toString());
		}
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
	
	@PostMapping("/book/success")
	public String successBooking(String exceptGrade, String scheduleCode, String[] seatCode, String basePrice, String disCountPrice,
							String totalPrice, String savedPoint, String usedPoint, String usedCoupon, @LoginUser User user, Model model) {
		String beforeGrade = user.getGrade();
		BookingDto book = new BookingDto();
		book.setExceptGrade(exceptGrade);
		book.setScheduleCode(scheduleCode);
		book.setSeatCode(seatCode);
		book.setBasePrice((basePrice != "" ? Integer.parseInt(basePrice) : 0));
		book.setDisCountPrice((disCountPrice != "" ? Integer.parseInt(disCountPrice) : 0));
		book.setTotalPrice((totalPrice != "" ? Integer.parseInt(totalPrice) : 0));
		book.setSavedPoint((savedPoint != "" ? Integer.parseInt(savedPoint) : 0));
		book.setUsedPoint((usedPoint != "" ? Integer.parseInt(usedPoint) : 0));
		book.setUsedCoupon(usedCoupon);
		
		Map<String, Object> result = bookingServcie.successBooking(book);
		model.addAttribute("beforeGrade", beforeGrade);
		model.addAttribute("book", book);
		model.addAttribute("booking", result.get("booking"));
		model.addAttribute("schedule", result.get("schedule"));
		model.addAttribute("seats", result.get("seats"));
		return "booking/success";
	}

}
