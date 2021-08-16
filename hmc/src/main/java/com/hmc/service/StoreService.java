package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.GiftProduct;
import com.hmc.vo.Payment;
import com.hmc.vo.Product;

public interface StoreService {

	List<Product> getAllProduct();
	
	Product getProductByCode(String productCode);
	
	int getTotalProductsRows();
	
	List<Product> getProductPagination(Map<String, Object> pageInfo);
	
	List<String> getAllProductCategory();
	
	void insertProduct(Product product);
	
	void deleteProductByCode(String ProductCode);
	
	void updateProduct(Product product);

	void successPayment(Map<String, Object> paymentInfo);
	
	Map<String, Object> getUserPaymentGifts(int pageNo);
	
	Map<String, Object> getUserReceiveGifts(int pageNo);
	
}
