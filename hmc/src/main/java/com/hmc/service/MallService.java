package com.hmc.service;

import java.util.List;

import com.hmc.vo.Product;

public interface MallService {
	
<<<<<<< HEAD

	void mallServiceTest();
	
	void giftTest();

=======
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
	List<Product> getAllProduct();
	
	Product getProductByCode();
	
	int getTotalProductsRows();
	
	void insertProduct(Product product);
	
	void deleteProductByCode(String ProductCode);
	
	void updateProduct(Product product);
<<<<<<< HEAD

=======
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
}
