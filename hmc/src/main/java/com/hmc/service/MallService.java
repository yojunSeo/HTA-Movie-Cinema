package com.hmc.service;

import java.util.List;

import com.hmc.vo.Product;

public interface MallService {
	
<<<<<<< HEAD
	void mallServiceTest();
	
	void giftTest();
=======
	List<Product> getAllProduct();
	
	Product getProductByCode();
	
	int getTotalProductsRows();
	
	void insertProduct(Product product);
	
	void deleteProductByCode(String ProductCode);
	
	void updateProduct(Product product);
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
}
