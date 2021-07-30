package com.hmc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.NoticeService;
import com.hmc.vo.Notice;
import com.hmc.vo.Pagination;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	NoticeService noticeService;
	
	private static Logger logger = LogManager.getLogger(CsController.class);
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;

	@GetMapping("/home")
	public String notice(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		List<Notice> notices = noticeService.getAllNotices(param);
		System.out.println("실행됨");
		model.addAttribute("notices", notices);
		
		int totalRows = noticeService.getTotalRows(param);
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
		
		return "cs/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("code") String code, Model model) {
		Notice notice = noticeService.getNoticeByCode(code);
		notice.setViewCnt(notice.getViewCnt()+1);
		noticeService.updateNotice(notice);
		model.addAttribute("notice", notice);
		
		return "cs/noticeDetail";
	}
	
	@GetMapping("/membership")
	public String membership() {
		return "cs/membership";
	}
	
	@GetMapping("/inqueryForm")
	public String inqueryForm() {
		return "cs/inqueryForm";
	}
	
	@PostMapping("/submitInquery")
	public String submitInquery() {
		return "../home";
	}

}
