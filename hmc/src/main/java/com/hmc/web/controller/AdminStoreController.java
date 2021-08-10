package com.hmc.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hmc.service.MallService;
import com.hmc.vo.Pagination;
import com.hmc.vo.Product;
import com.hmc.web.form.ProductForm;

@Controller
@RequestMapping("/admin/mall")
public class AdminStoreController {

	@Autowired
	MallService mallService;
	
	// 한 페이지당 표시할 게시글 행의 개수
	private static final int ROWS_PER_PAGE = 10;
	// 페이지블록 당 한번에 표시할 페이지번호 개수
	private static final int PAGES_PER_PAGE_BLOCK = 5;
	
	@RequestMapping("/list")
	public String productList(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model) {
		
		List<String> categories = mallService.getAllProductCategory();
		model.addAttribute("categories", categories);
		
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("beginIndex", (page-1)*ROWS_PER_PAGE +1);
		param.put("endIndex", page*ROWS_PER_PAGE);
		
		List<Product> productList = mallService.getProductPagination(param);
		model.addAttribute(productList);
		
		int totalRows = mallService.getTotalProductsRows();
		int totalPages = (int) Math.ceil((double) totalRows/ROWS_PER_PAGE);
		int totalPageBlocks = (int) Math.ceil((double)totalPages/PAGES_PER_PAGE_BLOCK);
		int currentPageBlock = (int) Math.ceil((double)page/PAGES_PER_PAGE_BLOCK);
		int beginPage = (currentPageBlock - 1)*PAGES_PER_PAGE_BLOCK +1;
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
		
		return "admin/mall/list";
	}
	
	@PostMapping("/add")
	public String productAdd(ProductForm form, HttpServletRequest request) throws IOException {
		
		Product product = new Product();
		
		product.setCategory(form.getCategory());
		product.setName(form.getName());
		product.setPrice(form.getPrice());
		product.setDiscountRate(form.getDiscountRate());
		product.setStock(form.getStock());
		product.setMemo(form.getMemo());
		MultipartFile imageFile = form.getImageFile();
		
		// 파일이름 중복방지를 위해 유닉스 타임을 주려다가...
		// 그냥 같은 이름 없게 체크 한번 해주는것으로 해야겟음;
		String imageFileName = imageFile.getOriginalFilename(); 
		
		// 같은 파일명 체크하기
		List<Product> products = mallService.getAllProduct();
		
		int checkNum = 1;
		System.out.println(products);
		if(products != null) {
			for(int i=0; i<products.size(); i++) {
				String savedFileName = products.get(i).getImageFileName();
				System.out.println(i + "|" + savedFileName + "|" + imageFileName);
				if(savedFileName.equals(imageFileName)) {
					String name = imageFileName.substring(0, imageFileName.indexOf("."));
					String ext = imageFileName.substring(imageFileName.indexOf("."));
					imageFileName = name + checkNum + ext; 
					i=-1; checkNum++;
					continue;
				}
			}
		}
		
		
		product.setImageFileName(imageFileName);
		
		// images/store 의 경로 받아오기
		String rootPath = request.getSession().getServletContext().getRealPath("");
		String projectPath = rootPath.substring(0,rootPath.indexOf(".metadata")) + "hmc/hmc/src/main/webapp/resources/images/store/product";
		
		FileCopyUtils.copy(imageFile.getInputStream(), new FileOutputStream(new File(projectPath, imageFileName)));
		
		mallService.insertProduct(product);
		
		return "redirect:list";
	}
	
	@PostMapping("/modify")
	public String productUpdate(ProductForm form, HttpServletRequest request) throws IOException {
		
		System.out.println("=============================================");
		System.out.println(form);
		System.out.println("=============================================");
		Product savedproduct = mallService.getProductByCode(form.getProductCode());
		Product product = new Product();
		
		product.setCode(form.getProductCode());
		product.setCategory(form.getCategory());
		product.setName(form.getName());
		product.setPrice(form.getPrice());
		product.setDiscountRate(form.getDiscountRate());
		product.setStock(form.getStock());
		product.setMemo(form.getMemo());
		
		// 파일이 바뀌었을때와 아닐때 구분
		if(form.getImageFile().isEmpty()) {
			product.setImageFileName(savedproduct.getImageFileName());
		} else {
			MultipartFile imageFile = form.getImageFile();
			
			String imageFileName = imageFile.getOriginalFilename(); 
			
			// 같은 파일명 체크하기
			List<Product> products = mallService.getAllProduct();
			
			int checkNum = 1;
			System.out.println(products);
			if(products != null) {
				for(int i=0; i<products.size(); i++) {
					String savedFileName = products.get(i).getImageFileName();
					System.out.println(i + "|" + savedFileName + "|" + imageFileName);
					if(savedFileName.equals(imageFileName)) {
						String name = imageFileName.substring(0, imageFileName.indexOf("."));
						String ext = imageFileName.substring(imageFileName.indexOf("."));
						imageFileName = name + checkNum + ext; 
						i=-1; checkNum++;
						continue;
					}
				}
			}
			
			product.setImageFileName(imageFileName);
			
			String rootPath = request.getSession().getServletContext().getRealPath("");
			String projectPath = rootPath.substring(0,rootPath.indexOf(".metadata")) + "hmc/hmc/src/main/webapp/resources/images/store/product";
			
			FileCopyUtils.copy(imageFile.getInputStream(), new FileOutputStream(new File(projectPath, imageFileName)));
		}
		
		mallService.updateProduct(product);
		
		return "redirect:list";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public ResponseEntity<Void> delectProduct(@RequestParam("code") String productCode) {
		
		Product savedProduct = mallService.getProductByCode(productCode);
		
		if(savedProduct == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		mallService.deleteProductByCode(productCode);

		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	@RequestMapping("/detail")
	@ResponseBody
	public ResponseEntity<Product> detail(@RequestParam("code") String productCode) {
		
		Product product = mallService.getProductByCode(productCode);
		System.out.println(product);
		if(product == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(product, HttpStatus.OK);
	}
	
}
