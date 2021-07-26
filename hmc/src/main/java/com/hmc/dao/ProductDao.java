package com.hmc.dao;

import java.util.List;
import com.hmc.vo.Product;

public interface ProductDao {
	
	void insertProduct(Product product);

	List<Product> getAllProduct();
		
<<<<<<< HEAD
	Product getProductByCode(String prductCode);
	
	int getTotalProductsRows();
	
	void deleteProductByCode(String productCode);
	
	void updateProduct(Product product);
	

=======
	Product getProductByCode();
	
	int getTotalProductsRows();
	
	void deleteProductByCode(String ProductCode);
	
	void updateProduct(Product product);
>>>>>>> 93cd598888942a7493056f496c68ff94e36d588a
}
