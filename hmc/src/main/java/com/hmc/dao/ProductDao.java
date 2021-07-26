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
	
	
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
}
