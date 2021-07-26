package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.ProductDao;
import com.hmc.vo.Product;

@Service
public class MallServiceImpl implements MallService{

	@Autowired
	ProductDao productDao;
	
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
