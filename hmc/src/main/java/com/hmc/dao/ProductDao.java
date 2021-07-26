package com.hmc.dao;

import java.util.List;
import com.hmc.vo.Product;

public interface ProductDao {
	
	void insertProduct(Product product);

	List<Product> getAllProduct();
		
	Product getProductByCode();
	
	int getTotalProductsRows();
	
	void deleteProductByCode(String ProductCode);
	
	void updateProduct(Product product);
}
