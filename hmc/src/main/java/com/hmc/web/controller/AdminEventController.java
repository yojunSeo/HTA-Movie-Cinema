package com.hmc.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.dao.EventDao;
import com.hmc.dao.EventJoinDao;
import com.hmc.dao.PublishedCouponDao;
import com.hmc.service.CouponService;
import com.hmc.service.EventJoinService;
import com.hmc.service.EventService;
import com.hmc.service.UserService;
import com.hmc.vo.Coupon;
import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;
import com.hmc.vo.Notice;
import com.hmc.vo.Pagination;
import com.hmc.vo.PublishedCoupon;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;
import com.hmc.web.annotation.LoginUser;
import com.hmc.web.form.EventForm;
import com.hmc.web.form.ProductForm;
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
	
	@Autowired
	EventJoinService eventJoinService;
	
	@Autowired
	EventJoinDao eventJoindao;
	
	@Autowired
	PublishedCouponDao publishedCouponDao;
	
	@Autowired
	EventDao eventDao;
	
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
	
	// 이벤트 리스트
	@GetMapping("/eventList")
	public String eventForm(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "opt", required = false) String searchOption, 
			@RequestParam(name = "keyword", required = false) String searchKeyword,
			Model model, @LoginAdmin User loginAdmin) {
		
		// 이벤트 종료일과 비교하기 위한 오늘 날짜를 model에 저장
		model.addAttribute("today", new Date());
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		List<Event> events = eventService.eventListPage(param);
		model.addAttribute("events", events);
		
	
		Map<String, Object> param2 = new HashMap<String, Object>();
		
		List<Coupon> coupons = couponService.getCouponInfo(param2);
		model.addAttribute("coupons", coupons);
		
		
		
		model.addAttribute("loginedUser", loginedUser);
		
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
		eventDao.updateStatus();
		
		return "admin/event/eventList";
	}
	
	
	@PostMapping("/insertEvent")
	public String add(EventForm form, HttpServletRequest request, @LoginAdmin User loginAdmin) throws ParseException {
		System.out.println(form);
		Event event = new Event();
		event.setTitle(form.getTitle());
		event.setContent(form.getContent());
		event.setStartDate(form.getStartDate());
		event.setEndDate(form.getEndDate());
		event.setCouponCode(form.getCouponCode());
		event.setCouponAmount(form.getCouponAmount());
		event.setStatus(form.getStatus());
		System.out.println(event.getCouponCode()+"@@@@");
		
		User logginedUser = (User)SessionUtils.getAttribute("LOGINED_USER");
		event.setWriter(logginedUser.getId());
		eventService.insertEvent(event);
		
		// 선택한 쿠폰의 이벤트컬럼 업데이트
		Coupon coupon = couponService.getCouponByCode(form.getCouponCode());
		coupon.setEventCode(event.getCode());
		couponService.updateCoupon(coupon);
		
		return "redirect:eventList";
	}
	
	
	
	@PostMapping("/draw")
	public String eventJoin(@RequestParam(value="eventCode") String eventCode,
			@RequestParam("userId") String userId ,
			@RequestParam("couponCode") String couponCode,Model model) {

		eventJoindao.eventDraw(eventCode);
		System.out.println(eventCode+"1234");
		System.out.println(userId);
		System.out.println(couponCode);
		eventJoindao.changeS(eventCode);
		publishedCouponDao.insertPublichedCouponJoin(couponCode);
		
		return "/event/home";
	}
	
	
	@RequestMapping("/delete")
	public @ResponseBody ResponseEntity<Void> delete(@RequestParam("eventCode") String eventCode,@RequestParam("code") String code) {
		System.out.println("딜리트");
		Event savedEvent = eventDao.getEventByCode(eventCode);
		if (savedEvent == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		eventDao.deleteEvent(eventCode);
		eventDao.updateEventCodeIsNull(code);
		eventJoindao.deleteEventJoin(eventCode);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping("/joins")
	public @ResponseBody List<EventJoin> getjoin(@RequestParam("code") String eventCode){
		System.out.println(eventCode +"  모달창");
		List<EventJoin> joins = eventJoinService.getUserIdAndResult(eventCode);
		System.out.println(joins);
		return joins;
	}
	
	@RequestMapping("/detail")
	public @ResponseBody ResponseEntity<Event> detail(@RequestParam("code") String eventCode, @LoginAdmin User loginAdmin) {
		Event savedEvent = eventDao.getEventByCode(eventCode);
		System.out.println("디테일 실행");
		if(savedEvent == null) {
			System.out.println("디테일 실패");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		System.out.println("디테일 실행");
		System.out.println(savedEvent);
		return new ResponseEntity<>(savedEvent, HttpStatus.OK);
	}
	
	
	@PostMapping("/modify")
	public String productUpdate(EventForm form, HttpServletRequest request, @LoginAdmin User loginAdmin) throws IOException {
		
		Event event = new Event();
		
		event.setCode(form.getCode());
		event.setTitle(form.getTitle());
		event.setContent(form.getContent());
		event.setStartDate(form.getStartDate());
		event.setEndDate(form.getEndDate());
		event.setCouponCode(form.getCouponCode());
		event.setCouponAmount(form.getCouponAmount());
		
		eventService.updateEvent(event);
		
		return "redirect:eventList";
	}
	
}
