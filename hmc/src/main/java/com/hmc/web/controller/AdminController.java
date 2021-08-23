package com.hmc.web.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.service.StaticService;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;
import com.hmc.web.util.DateUtils;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private StaticService staticService;

	@GetMapping("/main")
	public String adminMain(@LoginAdmin User admin) {
		return "admin/main";
	}
	
	@GetMapping("/rest/static/user")
	public @ResponseBody ResponseEntity<Map<String, Object>> getUserStaticData(){
		Map<String, Object> results = new HashMap<String, Object>();
		results.put("gender", staticService.getUserGenderStatic());
		results.put("age", staticService.getUserAgeStatic());
		
		return new ResponseEntity<Map<String,Object>>(results,HttpStatus.OK);
	}
	
	@GetMapping("/rest/static/branch/sales")
	public @ResponseBody ResponseEntity<List<Map<String, Object>>> getBranchSalesStaticData(@RequestParam("date")String date) {
		List<Map<String, Object>> results = staticService.getBranchSalesStatic(date);
		return new ResponseEntity<List<Map<String, Object>>>(results,HttpStatus.OK);
	}
	
	@GetMapping("/rest/static/branch/booking")
	public @ResponseBody ResponseEntity<List<Map<String, Object>>> getBranchBookingStaticData(@RequestParam("date")String date){
		List<Map<String, Object>> results = staticService.getBranchBookingRateStatic(date);
		return new ResponseEntity<List<Map<String, Object>>>(results, HttpStatus.OK);
	}
}
