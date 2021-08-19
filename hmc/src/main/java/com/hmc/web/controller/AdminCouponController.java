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
	
	@RequestMapping("/coupon/detail")
	public @ResponseBody ResponseEntity<Coupon> detail(@RequestParam("code") String couponCode, @LoginAdmin User loginAdmin) {
		System.out.println(couponCode + "1234");
		Coupon savedCoupon = couponDao.getCouponByCode(couponCode);
		System.out.println("디테일 실행됨");
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
		System.out.println("수정 실행임니다!");

		System.out.println(coupon+"123");
		Coupon savedCoupon = couponDao.getCouponByCode(coupon.getCode());
		System.out.println(coupon+"1234");
		if (savedCoupon == null) {
			System.out.println("if문 실행");
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		System.out.println(coupon.getType());
		System.out.println(coupon.getName());
		savedCoupon.setType(coupon.getType());
		savedCoupon.setName(coupon.getName());
		
		couponDao.modifyCoupon(savedCoupon);
		
		return new ResponseEntity<>(savedCoupon, HttpStatus.OK);
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
	
	@GetMapping("/coupon/couponModal")
	public String modalMome() {
		
		
		return "admin/coupon/couponModal";
	}
	
}
