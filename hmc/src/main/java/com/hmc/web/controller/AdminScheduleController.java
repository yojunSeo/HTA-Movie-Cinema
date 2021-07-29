package com.hmc.web.controller;

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

import com.hmc.service.ScheduleService;
import com.hmc.vo.Branch;
import com.hmc.vo.Movie;
import com.hmc.vo.Pagination;
import com.hmc.vo.Schedule;
import com.hmc.vo.ScheduleDetail;
import com.hmc.vo.ScreenMovie;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	private static final int ROWS_PER_PAGE = 10;
	private static final int PAGE_PER_PAGE_BLOCK = 5;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/screen/list")
	public String screenMovieList(@RequestParam(name = "page", required = false, defaultValue = "1")int pageNo, Model model) {
		
		List<Movie> nonScreenMovies = scheduleService.getAllNonScreeMovies();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		List<ScreenMovie> screenMovies = scheduleService.getScreenMovies(param);
		
		int totalRows = scheduleService.getScreenMoviesCnt();
		int totalPages = (int)Math.ceil((double)totalRows/ROWS_PER_PAGE);
		int totalBlocks = (int)Math.ceil((double)totalPages/PAGE_PER_PAGE_BLOCK);
		int currentBlock = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		int beginPage = (currentBlock-1)*PAGE_PER_PAGE_BLOCK +1; 
		int endPage = currentBlock*PAGE_PER_PAGE_BLOCK;
		if(currentBlock == totalBlocks) {
			endPage = totalPages;
		}

		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage);
		pagination.setCurrentPageBlock(currentBlock);
		pagination.setEndPage(endPage);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks);
		pagination.setTotalPages(totalPages);
		pagination.setTotalRows(totalRows);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("movies", nonScreenMovies);
		model.addAttribute("screens", screenMovies);
		
		return "admin/schedule/screen";
	}
	
	@GetMapping("/register")
	public String scheduleRegisterForm(Model model) {
		List<Branch> branchs = scheduleService.getAllBranchs();
		List<ScreenMovie> movies = scheduleService.getAllScreenMovies();
		model.addAttribute("branchs", branchs);
		model.addAttribute("movies", movies);
		return "admin/schedule/register";
	}
	
	@PostMapping("/register")
	public String scheduleRegister(Schedule schedule) {
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public String scheduleListPagination(@RequestParam(name = "page", required = false, defaultValue = "1") int pageNo, Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		// 해당 페이지에 해당하는 스케줄 조회
		param.put("beginIndex", (pageNo-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", pageNo*ROWS_PER_PAGE);
		List<ScheduleDetail> schedules = scheduleService.getSchedules(param);
		
		// 페이징 처리
		// 총 행의 갯수 구하기
		int totalRows = scheduleService.getAllSchedulesCnt(param);
		// 총 페이지 갯수 구하기
		int totalPages = (int)Math.ceil((double)totalRows/ROWS_PER_PAGE);
		// 총 페이지 블록갯수 
		int totalBlocks = (int)Math.ceil((double)totalPages/PAGE_PER_PAGE_BLOCK);
		// 요청한 페이지번호가 속하는 페이지 블록 계산
		int currentBlock = (int)Math.ceil((double)pageNo/PAGE_PER_PAGE_BLOCK);
		// 현재 페이지 블록의 시작과 끝 페이지 번호계산
		int beginPage = (currentBlock-1)*PAGE_PER_PAGE_BLOCK + 1;
		int endPage = currentBlock*PAGE_PER_PAGE_BLOCK;
		if(currentBlock == totalBlocks) {
			endPage = totalPages;
		}
		Pagination pagination = new Pagination();
		pagination.setBeginPage(beginPage);
		pagination.setCurrentPageBlock(currentBlock);
		pagination.setEndPage(endPage);
		pagination.setPageNo(pageNo);
		pagination.setTotalPageBlocks(totalBlocks);
		pagination.setTotalPages(totalPages);
		pagination.setTotalRows(totalRows);
		model.addAttribute("pagination", pagination);
		
		List<Branch> branchs = scheduleService.getAllBranchs();
		List<ScreenMovie> movies = scheduleService.getAllScreenMovies();
		model.addAttribute("branchs", branchs);
		model.addAttribute("schedules", schedules);
		model.addAttribute("movies", movies);
		return "admin/schedule/list";
	}
}
