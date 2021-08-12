package com.hmc.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.BranchService;
import com.hmc.service.InqueryService;
import com.hmc.service.NoticeService;
import com.hmc.service.UserService;
import com.hmc.vo.Inquery;
import com.hmc.vo.Notice;
import com.hmc.vo.Pagination;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;
import com.hmc.web.annotation.LoginAdmin;
import com.hmc.web.annotation.LoginUser;


@Controller
@RequestMapping("/cs")
public class CsController {
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	InqueryService inqueryService;
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	UserService userService;
	
	
	private static Logger logger = LogManager.getLogger(CsController.class);
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	// 공지사항 리스트
	@GetMapping("/home")
	public String notice(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		
		List<Notice> notices = noticeService.getAllNotices(param);
		
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
	// 나의 1:1문의 리스트
	@GetMapping("/myInqueryList")
	public String myInqueryList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model, @LoginUser User user) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		param.put("userId", loginedUser.getId());
		
		List<Inquery> inquerys = inqueryService.getAllInquerysByUserId(param);
		
		model.addAttribute("inquerys", inquerys);
		
		int totalRows = inqueryService.getTotalRowsByUserId(param);
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
		
		return "cs/myInqueryList";
	}
	// 나의 1:1문의 상세정보
	@GetMapping("/myInqueryDetail")
	public String inqueryDetail(@RequestParam("code") String code, Model model, @LoginUser User user) {
		Inquery inquery = inqueryService.getInqueryByCode(code);
		model.addAttribute("inquery", inquery);
		
		return "cs/inqueryDetail";
	}
	
	// 공지사항 상세정보
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("code") String code, Model model) {
		Notice notice = noticeService.getNoticeByCode(code);
		notice.setViewCnt(notice.getViewCnt()+1);
		noticeService.updateNotice(notice);
		model.addAttribute("notice", notice);
		
		return "cs/noticeDetail";
	}
	// 멤버십
	@GetMapping("/membership")
	public String membership() {
		return "cs/membership";
	}
	// 1:1문의 등록폼
	@GetMapping("/inqueryForm")
	public String inqueryForm(@LoginUser User user ,Model model) {
		return "cs/inqueryForm";
	}
	// 1:1문의 등록
	@PostMapping("/submitInquery")
	public String submitInquery(@RequestParam("opt") String category, @RequestParam("title") String title, @RequestParam("content") String content) {
		Inquery inquery = new Inquery();
		inquery.setCategory(category);
		inquery.setTitle(title);
		inquery.setContent(content);
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		inquery.setUserId(loginedUser.getId());
		inqueryService.insertInquery(inquery);
		return "redirect:../home?formsubmit=true";
	}

}
