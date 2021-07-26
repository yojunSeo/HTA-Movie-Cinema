package com.hmc.service;

import java.util.List;

import com.hmc.vo.Product;

public interface MallService {
	
	List<Product> getAllProduct();
	
	Product getProductByCode();
	
	int getTotalProductsRows();
	
	void insertProduct(Product product);
	
	void deleteProductByCode(String ProductCode);
	
	void updateProduct(Product product);
}
