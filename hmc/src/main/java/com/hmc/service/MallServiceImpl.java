package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.GiftProductDao;
import com.hmc.dao.ProductCategoryDao;
import com.hmc.dao.ProductDao;
import com.hmc.vo.GiftProduct;

import com.hmc.dao.ProductDao;

import com.hmc.dao.ProductDao;
import com.hmc.vo.Product;

@Service
public class MallServiceImpl implements MallService{

	@Autowired
	ProductDao productDao;

	@Autowired
	ProductCategoryDao productCategoryDao;
	
	@Override
	public void mallServiceTest() {
		
		// 삽입 테스트
		Product insert_product = new Product();
		
		/*
		insert_product.setCategory("관람권");
		insert_product.setName("1인 관람권");
		insert_product.setPrice(10000);
		insert_product.setStock(500);
		insert_product.setMemo("현장에서만 사용 가능합니다.");
		productDao.insertProduct(insert_product);
		*/
		
		// getAll 테스트
		/*
		List<Product> productList = productDao.getAllProduct();
		for(Product product : productList) {
			System.out.println(product);
		}
		*/
		
		// getProductByCode 테스트
		Product product = productDao.getProductByCode("PD000004");
		System.out.println(product);
		
		Product product2 = productDao.getProductByCode("PD001235");
		System.out.println(product2);
		
		// getTotalProductsRows 테스트
		int row = productDao.getTotalProductsRows();
		System.out.println(row);
		
		// deleteProductByCode 테스트
		//productDao.deleteProductByCode("PD000023");
		
		// updateProduct 테스트
		Product product3 = productDao.getProductByCode("PD000025");
		product3.setCategory("패키지");
		product3.setName("2인관람권+팝콘");
		product3.setPrice(25000);
		product3.setDiscount_rate(10);
		product3.setStock(210);
		product3.setMemo("패키지 상품을 테스트해 봅니다.");
		
		//productDao.updateProduct(product3);
		
		List<String> pcs = productCategoryDao.getAllProductCategory();
		
		for(String cate: pcs) {
			System.out.println(cate);
		}
		
	}
	
	@Autowired
	GiftProductDao giftProductDao;
	
	@Override
	public void giftTest() {
		// 상품 선물 테스트
		/*
		GiftProduct gift = new GiftProduct();
		
		gift.setProductCode("PD000025");
		gift.setPaymentCode("PM000042");
		gift.setGiveUser("lee");
		gift.setReceiveUser("hong");
		gift.setPrice(25000);
		gift.setAmount(3);
		
		giftProductDao.insertGiftProduct(gift);
		*/
		// 나의 선물 조회하기 테스트
		List<GiftProduct> giftList = giftProductDao.getMyGiftProduct("hong");
		
		for(GiftProduct giftproduct : giftList) {
			System.out.println(giftproduct);
		}
		
		// 선물사용 테스트
		
		giftProductDao.updateUsedStatusToY("GT000044");
	}
	
	@Override
	public void insertProduct(Product product) {
		
		productDao.insertProduct(product);
		
	}
	
	@Override
	public List<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Product getProductByCode() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getTotalProductsRows() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteProductByCode(String ProductCode) {
		// TODO Auto-generated method stub
		
	}

}
