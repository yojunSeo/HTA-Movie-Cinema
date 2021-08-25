package com.hmc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hmc.dao.EventDao;
import com.hmc.dao.EventJoinDao;
import com.hmc.service.CouponService;
import com.hmc.service.EventJoinService;
import com.hmc.service.EventService;
import com.hmc.service.EventServiceImpl;
import com.hmc.service.UserService;
import com.hmc.vo.Coupon;
import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;
import com.hmc.vo.Pagination;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginUser;
import com.hmc.web.util.SessionUtils;

@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@Autowired
	private CouponService couponService;
	
	
	@Autowired
	private EventJoinDao eventJoinDao;
	
	@Autowired EventJoinService eventJoinService;
	
	@Autowired
	private EventDao eventDao;
	
 	
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	
	
	@GetMapping("/home")
	public String eventHome(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
							@RequestParam(name = "opt", required = false) String searchOption, 
							@RequestParam(name = "keyword", required = false) String searchKeyword,
							Model model) 
	{
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		// 로그인시 뷰
		if(loginedUser!=null) {
			param.put("userId", loginedUser.getId());
			List<Event> events = eventService.eventListPageByWating(param);
			model.addAttribute("events", events);
		}else {	// 비로그인시 뷰
			List<Event> events = eventService.eventListPageByProceeding(param);
			model.addAttribute("events", events);
		}
		//userId.setUserId(loginedUser.getId());
		//String userIds = userId.getUserId();
		//System.out.println(userIds+"############");
		
		//Event events = eventService.eventListPageByWating(loginedUser.getId());
		System.out.println("실행됨");
		
		List<EventJoin> joins = eventJoinService.getEventJoinReSultByUserId(param);
		model.addAttribute("joins", joins);
		System.out.println();
		System.out.println();
		System.out.println();
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
		
		
		
		
		return "event/main";
	}
	
	@GetMapping("/detail")
	public String eventDetail(@RequestParam("no") String eventCode, @LoginUser User user, Model model) {
		
		Event events = eventService.eventDetail(eventCode);
		Event event = eventService.getEventByCode(eventCode);
		EventJoin eventJoin = (EventJoin) eventJoinService.getEventJoinByEventCode(eventCode);
		
		System.out.println(eventJoin);
		System.out.println("김김");
		model.addAttribute("event", event);
		model.addAttribute("events", events);
		model.addAttribute("eventJoin", eventJoin);
		
		
		return "event/detail";
	}
	
	@GetMapping("/add")
	public String add(Event event) {
		
		return "event/add";
	}
	
	@GetMapping("/adds")	
	public String eventAdd(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Event> events = eventService.eventListPage(param);
		System.out.println("실행됨");
		model.addAttribute("events", events);
		
		List<Coupon> coupons = couponService.couponListPage(param);
		System.out.println("실행됨");
		model.addAttribute("coupons", coupons);
		
		return "event/eventAdd";
	}
	
	
	@PostMapping("/eventJoin")
	public String eventJoin(@RequestParam("eventCode") String eventCode) {
		System.out.println(eventCode);
		User user =  (User) SessionUtils.getAttribute("LOGINED_USER");
		EventJoin eventJoin = new EventJoin();
		eventJoin.setEventCode(eventCode);
		System.out.println(eventJoin);
		
		eventJoin.setUserId(user.getId());
		
		eventJoinDao.insertEventJoin(eventJoin);
		
		return "redirect:/event/main";
	}
	
	
}
