package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Product;

public interface ProductDao {
	
	void insertProduct(Product product);

	List<Product> getAllProduct();

	List<Product> getProductByIndex(Map<String, Object> param);
	
	Product getProductByCode(String prductCode);
	
	int getTotalProductsRows();
	
	void deleteProductByCode(String productCode);
	
	void updateProduct(Product product);
	
}
