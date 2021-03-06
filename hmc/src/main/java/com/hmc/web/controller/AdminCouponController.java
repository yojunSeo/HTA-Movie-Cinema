package com.hmc.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.hmc.dao.CouponCategoryDao;
import com.hmc.dao.CouponDao;
import com.hmc.dao.EventDao;
import com.hmc.dao.EventJoinDao;
import com.hmc.dao.PublishedCouponDao;
import com.hmc.service.CouponService;
import com.hmc.service.PublishedCouponService;
import com.hmc.vo.Coupon;
import com.hmc.vo.Event;
import com.hmc.vo.Pagination;
import com.hmc.vo.PublishedCoupon;
import com.hmc.vo.User;
import com.hmc.web.annotation.LoginAdmin;
import com.hmc.web.form.CouponForm;

@Controller
@RequestMapping("/admin")
public class AdminCouponController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private CouponCategoryDao couponCategoryDao;
	
	@Autowired
	private PublishedCouponDao publishedCouponDao;
	
	@Autowired
	private EventDao eventDao;
	
	@Autowired
	private EventJoinDao eventJoinDao;
	
	@Autowired
	private PublishedCouponService publishedCouponService;
	
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수ㅈ
	private static final int PAGES_PER_PAGE_BLOCK = 5;

	@GetMapping("/coupon/home")
	public String mainHome(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "opt", required = false) String searchOption, 
			@RequestParam(name = "keyword", required = false) String searchKeyword, 
			Model model, @LoginAdmin User loginAdmin)  {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		List<Coupon> coupons = couponService.couponListPage(param);
		System.out.println("실행됨");
		model.addAttribute("coupons", coupons);
		
		//List<Coupon> eventCodes = couponService.
		
		List<String> categories = couponCategoryDao.getAllCouponCategorys();
		model.addAttribute("categories", categories);
		
		int totalRows = couponService.getTotalRows(param);
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
		
		return "admin/coupon/list";
	}
	
	@GetMapping("/coupon/eventCouponList")
	public String eventCouponList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "opt", required = false) String searchOption, 
			@RequestParam(name = "keyword", required = false) String searchKeyword, 
			Model model, @LoginAdmin User loginAdmin)  {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		List<Coupon> coupons = couponService.couponListPageByEvent(param);
		System.out.println("실행됨");
		model.addAttribute("coupons", coupons);
		
		//List<Coupon> eventCodes = couponService.
		
		List<String> categories = couponCategoryDao.getAllCouponCategorys();
		model.addAttribute("categories", categories);
		
		int totalRows = couponService.getTotalRowsByEvent(param);
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
		
		return "admin/coupon/eventCouponList";
	}
	
	@GetMapping("/coupon/paymentList")
	public String paymentList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "opt", required = false) String searchOption, 
			@RequestParam(name = "keyword", required = false) String searchKeyword, 
			Model model, @LoginAdmin User loginAdmin)  {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		List<Coupon> coupons = couponService.couponListPageByPublished(param);
		System.out.println("실행됨");
		model.addAttribute("coupons", coupons);
		
		//List<Coupon> eventCodes = couponService.
		
		List<String> categories = couponCategoryDao.getAllCouponCategorys();
		model.addAttribute("categories", categories);
		
		int totalRows = couponService.getTotalRowsByPublished(param);
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
		
		return "admin/coupon/paymentList";
	}
	
	@GetMapping("/coupon/noPaymentList")
	public String noPaymentList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "opt", required = false) String searchOption, 
			@RequestParam(name = "keyword", required = false) String searchKeyword, 
			Model model, @LoginAdmin User loginAdmin)  {
		
		Map<String, Object> param = new HashMap<String, Object>();
		if(searchOption != null && searchKeyword != null ) {
			page=1;
			param.put("opt", searchOption);
			param.put("keyword", searchKeyword);
		}
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE+1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		System.out.println(param);
		List<Coupon> coupons = couponService.couponListPageByNull(param);
		System.out.println("실행됨");
		model.addAttribute("coupons", coupons);
		
		//List<Coupon> eventCodes = couponService.
		
		List<String> categories = couponCategoryDao.getAllCouponCategorys();
		model.addAttribute("categories", categories);
		
		int totalRows = couponService.getTotalRowsByNull(param);
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
		
		return "admin/coupon/noPaymentList";
	}
	
	@RequestMapping("/coupon/detail")
	public @ResponseBody ResponseEntity<Coupon> detail(@RequestParam("code") String couponCode, @LoginAdmin User loginAdmin) {
		Coupon savedCoupon = couponDao.getCouponByCode(couponCode);
		System.out.println("디테일 실행됨");
		System.out.println(couponCode);
		if(savedCoupon == null) {
			System.out.println("디테일 실패");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<>(savedCoupon, HttpStatus.OK);
	}
	
	@RequestMapping("/coupon/add")
	public @ResponseBody ResponseEntity<Coupon> add(Coupon coupon, @LoginAdmin User loginAdmin){
		System.out.println("쿠폰등록");
		couponDao.insertCoupon(coupon);
		
		Coupon savedCoupon = couponDao.getCouponByCode(coupon.getCode());
		
		return new ResponseEntity<Coupon>(savedCoupon, HttpStatus.OK);
	}
	
	@RequestMapping("/coupon/modify")
	public @ResponseBody ResponseEntity<Coupon> modify(Coupon coupon, @LoginAdmin User loginAdmin) {
		Coupon savedCoupon = couponDao.getCouponByCode(coupon.getCode());
		if (savedCoupon == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		System.out.println(coupon.getType());
		System.out.println(coupon.getName());
		savedCoupon.setType(coupon.getType());
		savedCoupon.setName(coupon.getName());
		
		couponDao.modifyCoupon(savedCoupon);
		
		return new ResponseEntity<>(savedCoupon, HttpStatus.OK);
	}
	
	@PostMapping("/coupon/modify2")
	public String couponModify(CouponForm couponForm, HttpServletRequest request, @LoginAdmin User loginAdmin) throws IOException {
		Coupon savedCoupon = couponService.getCouponByCode(couponForm.getCode());
		Coupon coupon = new Coupon();
		
		coupon.setType(couponForm.getType());
		coupon.setName(couponForm.getName());
		
		couponService.modifyCoupon(coupon);
		
		
		return null;
	}
	
	@RequestMapping("/coupon/delete")
	public @ResponseBody ResponseEntity<Void> delete(@RequestParam("code") String couponCode, @LoginAdmin User loginAdmin) {
		System.out.println("딜리트");
		Coupon savedCoupon = couponDao.getCouponByCode(couponCode);
		Map<String, Object> param = new HashMap<String, Object>();
		if (savedCoupon == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		// publishedCoupon 조회
		String pcode = publishedCouponDao.checkPublishedCouponCode(couponCode);
		String ec = couponDao.getEventCodeByCouponCode(couponCode);
		
		if(pcode == null) {
			if(ec==null) {
				couponDao.deleteCoupon(couponCode);
			}
		}
		
		System.out.println(ec+"1212");
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	@RequestMapping("/coupon/publishedCoupons")
	public @ResponseBody List<PublishedCoupon> getjoin(@RequestParam("code") String couponCode){
		System.out.println(couponCode +"  모달창");
		List<PublishedCoupon> publishedCoupons = publishedCouponService.getDateByPublishedCoupon(couponCode);
		System.out.println(publishedCoupons);
		return publishedCoupons;
	}
	
}
