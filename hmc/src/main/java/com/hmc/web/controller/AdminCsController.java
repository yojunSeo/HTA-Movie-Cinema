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
import com.hmc.web.annotation.LoginAdmin;
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
	
	// 1:1문의 리스트
	@GetMapping("/inqueryList")
	public String inquery(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model, @LoginAdmin User loginAdmin) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		
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
	
	// 답변 미완료된 1:1문의 리스트
	@GetMapping("/incompleteInqueryList")
	public String incompleteInquery(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model, @LoginAdmin User loginAdmin) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		
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
	
	// 1:1문의 상세정보
	@GetMapping("/inqueryDetail")
	public String inqueryDetail(@RequestParam("code") String code, Model model, @LoginAdmin User loginAdmin) {
		Inquery inquery = inqueryService.getInqueryByCode(code);
		model.addAttribute("inquery", inquery);
		
		return "admin/cs/inqueryDetail";
	}
	
	// 답변 미완료인 1:1문의 상세정보
	@GetMapping("/incompleteInqueryDetail")
	public String incompleteInqueryDetail(@RequestParam("code") String code, Model model, @LoginAdmin User loginAdmin) {
		Inquery inquery = inqueryService.getInqueryByCode(code);
		model.addAttribute("inquery", inquery);
		
		return "admin/cs/incompleteInqueryDetail";
	}
	
	// 1:1문의 등록
	@PostMapping("/submitInquery")
	public String submitInquery(@RequestParam("code") String code, @RequestParam("responder") String responder, @RequestParam("content") String content, @LoginAdmin User loginAdmin) {
		
		Inquery inquery = inqueryService.getInqueryByCode(code);
		inquery.setResponder(responder);
		inquery.setRespondContent(content);
		inquery.setRespondDate(new Date());
		inqueryService.adminUpdateInquery(inquery);
		
		return"redirect:inqueryList?submitInquery=true";
		
	}
	
	// 공지사항 리스트
	@GetMapping("/noticeList")
	public String notice(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model, @LoginAdmin User loginAdmin) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
			//page=1;
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
	
	// 공지사항 상세정보
	@GetMapping("/noticeDetail")
	public String noticeDetail(@RequestParam("code") String code, Model model, @LoginAdmin User loginAdmin) {
		Notice notice = noticeService.getNoticeByCode(code);
		noticeService.updateNotice(notice);
		model.addAttribute("notice", notice);
		
		return "admin/cs/noticeDetail";
	}	
	
	// 공지사항 삭제
	@GetMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("code") String code, @LoginAdmin User loginAdmin) {
		noticeService.deleteNotice(code);
		return"redirect:noticeList";
	}
	// 공지사항 수정폼으로 이동
	@GetMapping("/noticeModify")
	public String noticeModify(@RequestParam("code") String code, Model model, @LoginAdmin User loginAdmin) {
		Notice notice = noticeService.getNoticeByCode(code);
		model.addAttribute("notice", notice);
		return "admin/cs/noticeModify";
	}
	// 공지사항 수정
	@PostMapping("/noticeModify")
	public String noticeModify(@RequestParam("status") String status, @RequestParam("category") String category, 
								@RequestParam("title") String title, @RequestParam("content") String content, @RequestParam("code") String code, @LoginAdmin User loginAdmin) {
		Notice notice = noticeService.getNoticeByCode(code);
		notice.setStatus(status);
		notice.setCategory(category);
		notice.setTitle(title);
		notice.setContent(content);
		notice.setModifiedDate(new Date());
		
		noticeService.updateNotice(notice);
		return"redirect:noticeList?noticeModify=true";
	}
	// 공지사항 추가폼 이동
	@GetMapping("/insertNotice")
	public String insertNotice(@LoginAdmin User loginAdmin) {
		
		return"admin/cs/insertNotice";
		
	}
	// 공지사항 추가
	@PostMapping("/insertNotice")
	public String insertNotice(@RequestParam("title") String title, @RequestParam("category") String category, 
								@RequestParam("content") String content, @RequestParam("status") String status, @LoginAdmin User loginAdmin) {
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setCategory(category);
		notice.setContent(content);
		notice.setStatus(status);
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		notice.setWriter(loginedUser.getId());
		
		noticeService.insertNotice(notice);
		return"redirect:noticeList?insertNotice=true";
	}
	// 회원리스트
	@GetMapping("/userList")
	public String userList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, @RequestParam(name = "opt", required = false) String searchOption, @RequestParam(name = "keyword", required = false) String searchKeyword, Model model, @LoginAdmin User loginAdmin) {
		
		Map<String,Object> param = new HashMap<String, Object>();
		
		if(searchOption != null && searchKeyword != null ) {
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
	// 회원 상세정보
	@GetMapping("/userDetail")
	public String userDetail(@RequestParam("id") String id, Model model, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		
		return "admin/userManagement/userDetail";
	}
	// 회원탈퇴
	@GetMapping("/userDelete")
	public String userDelte(@RequestParam("id") String id, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		user.setWithdrawalDate(new Date());
		
		userService.deleteUser(user);
		return "redirect:userList";
	}
	// 회원 복구
	@GetMapping("/userRollback")
	public String userRollback(@RequestParam("id") String id, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		userService.rollbackUser(user);
		return"redirect:userList";
		
	}
	// 관리자 지정
	@GetMapping("/setAdmin")
	public String setAdmin(@RequestParam("id") String id, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		userService.setAdmin(user);
		return"redirect:userList";
		
	}
	// 관리자 권한 해제
	@GetMapping("/removeAdmin")
	public String removeAdmin(@RequestParam("id") String id, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		userService.removeAdmin(user);
		return"redirect:userList";
		
	}
	
	@GetMapping("/userModify")
	public String userModify(@RequestParam("id") String id, Model model, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return"admin/userManagement/userModify";
	}
	// 회원정보 수정
	@PostMapping("/userModify")
	public String userModify(@RequestParam("id") String id, @RequestParam("grade") String grade, @RequestParam("point") int point, @LoginAdmin User loginAdmin) {
		User user = userService.getUserById(id);
		user.setGrade(grade);
		user.setPoint(point);
		userService.updateUser(user);
		return "redirect:userList";
	}
	
	

}
