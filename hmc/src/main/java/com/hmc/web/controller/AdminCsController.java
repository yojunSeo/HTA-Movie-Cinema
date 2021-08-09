package com.hmc.web.controller;

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

import com.hmc.service.BranchService;
import com.hmc.service.InqueryService;
import com.hmc.service.NoticeService;
import com.hmc.service.UserService;
import com.hmc.vo.Inquery;
import com.hmc.vo.Notice;
import com.hmc.vo.Pagination;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/admin/cs")
public class AdminCsController {
	
	@Autowired
	InqueryService inqueryService;
	
	@Autowired
	BranchService branchService;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	UserService userService;
	
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	@GetMapping("/inqueryList")
	public String inquery(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", page+ROWS_PER_PAGE);
		
		List<Inquery> inquerys = inqueryService.getAllInquerys(param);
		
		model.addAttribute("inquerys", inquerys);
		
		int totalRows = inqueryService.getTotalRows(param);
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
		return "admin/cs/inqueryList";
	}
	
	@GetMapping("/incompleteInqueryList")
	public String incompleteInquery(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", page+ROWS_PER_PAGE);
		
		List<Inquery> inquerys = inqueryService.getAllInquerysY(param);
		
		model.addAttribute("inquerys", inquerys);
		
		int totalRows = inqueryService.getTotalRowsY(param);
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
		return "admin/cs/incompleteInqueryList";
	}
	
	@GetMapping("/inqueryDetail")
	public String inqueryDetail(@RequestParam("code") String code, Model model) {
		Inquery inquery = inqueryService.getInqueryByCode(code);
		model.addAttribute("inquery", inquery);
		
		return "admin/cs/inqueryDetail";
	}
	
	@GetMapping("/incompleteInqueryDetail")
	public String incompleteInqueryDetail(@RequestParam("code") String code, Model model) {
		Inquery inquery = inqueryService.getInqueryByCode(code);
		model.addAttribute("inquery", inquery);
		
		return "admin/cs/incompleteInqueryDetail";
	}
	
	@PostMapping("/submitInquery")
	public String submitInquery(@RequestParam("code") String code, @RequestParam("responder") String responder, @RequestParam("content") String content) {
		
		Inquery inquery = inqueryService.getInqueryByCode(code);
		inquery.setResponder(responder);
		inquery.setRespondContent(content);
		inquery.setRespondDate(new Date());
		inqueryService.adminUpdateInquery(inquery);
		
		return"redirect:inqueryList";
		
	}
	
	@GetMapping("/noticeList")
	public String notice(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
			page=1;
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
		
		return "admin/cs/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("code") String code, Model model) {
		Notice notice = noticeService.getNoticeByCode(code);
		noticeService.updateNotice(notice);
		model.addAttribute("notice", notice);
		
		return "admin/cs/noticeDetail";
	}	
	
	@GetMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("code") String code) {
		noticeService.deleteNotice(code);
		return"redirect:noticeList";
	}
	
	@GetMapping("/noticeModify")
	public String noticeModify(@RequestParam("code") String code, Model model) {
		Notice notice = noticeService.getNoticeByCode(code);
		model.addAttribute("notice", notice);
		return "admin/cs/noticeModify";
	}
	
	@PostMapping("/noticeModify")
	public String noticeModify(@RequestParam("status") String status, @RequestParam("category") String category, 
								@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("code") String code) {
		Notice notice = noticeService.getNoticeByCode(code);
		notice.setStatus(status);
		notice.setCategory(category);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setModifiedDate(new Date());
		
		noticeService.updateNotice(notice);
		return"redirect:noticeList";
	}
	
	@GetMapping("/insertNotice")
	public String insertNotice() {
		
		return"admin/cs/insertNotice";
		
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(@RequestParam("title") String title, @RequestParam("category") String category, 
								@RequestParam("content") String content, @RequestParam("status") String status) {
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setCategory(category);
		notice.setContent(content);
		notice.setStatus(status);
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		notice.setWriter(loginedUser.getId());
		
		noticeService.insertNotice(notice);
		return"redirect:noticeList";
	}
	
	@GetMapping("/userList")
public String userList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		
		List<User> users = userService.AdminGetAllUsers(param);
		
		model.addAttribute("users", users);
		
		int totalRows = userService.getTotalRows(param);
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
		
		return "admin/userManagement/userList";
	}

}
