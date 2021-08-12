package com.hmc.web.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.CouponService;
import com.hmc.service.EventService;
import com.hmc.service.UserService;
import com.hmc.vo.Coupon;
import com.hmc.vo.Event;
import com.hmc.vo.Notice;
import com.hmc.vo.Pagination;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;
import com.hmc.web.util.DateUtils;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {
	
	@Autowired
	EventService eventService;
	
	@Autowired
	CouponService couponService;
	
	@Autowired
	UserService userService;
	
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	@GetMapping("/eventForm")
	public String eventForm(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		
		List<Coupon> coupons = couponService.getCouponInfo(param);
		model.addAttribute("coupons", coupons);
		
		return "admin/event/add";
	}
	
	
	@GetMapping("/eventList")
	public String eventForm(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "opt", required = false) String searchOption, 
			@RequestParam(name = "keyword", required = false) String searchKeyword, 
			Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		List<Event> events = eventService.eventListPage(param);
		System.out.println("실행됨");
		model.addAttribute("events", events);
		
		int totalRows = eventService.getTotalRows(param);
		int totalPages = (int) Math.ceil((double) totalRows/ROWS_PER_PAGE);
		int totalPageBlocks = (int)Math.ceil((double)totalPages/PAGES_PER_PAGE_BLOCK);
		int currentPageBlock = (int) Math.ceil((double)page/PAGES_PER_PAGE_BLOCK);
		int beginPage = (currentPageBlock -1)*PAGES_PER_PAGE_BLOCK+1;
		int endPage = currentPageBlock*PAGES_PER_PAGE_BLOCK;
		if(currentPageBlock == totalPageBlocks) {
			endPage = totalPages;
		}
		Pagination pagination = new Pagination();
		pagination.setPageNo(page);
		pagination.setTotalRows(totalRows);
		pagination.setTotalPages(totalPages);
		pagination.setTotalPageBlocks(totalPageBlocks);
		pagination.setCurrentPageBlock(currentPageBlock);
		pagination.setBeginPage(beginPage);
		pagination.setEndPage(endPage);
		
		model.addAttribute("pagination", pagination);
		
		
		
		return "admin/event/eventList";
	}
	
	
	@PostMapping("/insertEvent")
	public String add(@RequestParam("title") String title, @RequestParam("writer") String writer, 
					@RequestParam("eventContent") String eventContent, @RequestParam("startDate") String startDate,
					@RequestParam("endDate") String endDate, @RequestParam("selectCoupon") String selectCoupon,
					@RequestParam("couponAmount") int couponAmount, @RequestParam("status") String status,
					@LoginAdmin User loginAdmin) throws ParseException {
		
		Event event = new Event();
		event.setTitle(title);
		event.setContent(eventContent);
		Date eventStart = DateUtils.stringToDate(startDate);
		event.setStartDate(eventStart);
		Date eventEnd = DateUtils.stringToDate(endDate);
		event.setEndDate(eventEnd);
		event.setCouponCode(selectCoupon);
		event.setCouponAmount(couponAmount);
		event.setStatus(status);
		
		//event.setWriter(loginAdmin.getId());
		User logginedUser = (User)SessionUtils.getAttribute("LOGINED_USER");
		event.setWriter(logginedUser.getId());
		System.out.println(event);
		eventService.insertEvent(event);
		
		return "rediret:eventList?insertEvent=true";
	}

}
