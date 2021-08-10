package com.hmc.service;

import java.util.List;
import java.util.Map;

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
	
	@Autowired
	GiftProductDao giftProductDao;
	
	@Override
	public void insertProduct(Product product) {
		
		productDao.insertProduct(product);
		
	}
	
	@Override
	public List<String> getAllProductCategory() {
		
		return productCategoryDao.getAllProductCategory();
	}
	
	@Override
	public List<Product> getAllProduct() {
		return productDao.getAllProduct();
	}
	
	@Override
	public int getTotalProductsRows() {
		return productDao.getTotalProductsRows();
	}

	@Override
	public List<Product> getProductPagination(Map<String, Object> pageInfo) {
		return productDao.getProductByIndex(pageInfo);
	}
	
	@Override
	public Product getProductByCode(String productCode) {
		return productDao.getProductByCode(productCode);
	}
	
	
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}
	
	@Override
	public void deleteProductByCode(String productCode) {
		productDao.deleteProductByCode(productCode);
		
	}

}
