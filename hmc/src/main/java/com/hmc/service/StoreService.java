package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.GiftProduct;
import com.hmc.vo.Payment;
import com.hmc.vo.Product;

public interface StoreService {

	/**
	 * DB에서 모든 상품 정보를 가져오는 메서드 
	 * @return Product VO 리스트
	 */
	List<Product> getAllProduct();
	
	/**
	 * 상품코드로 상품을 조회해서 반환하는 메서드
	 * @param productCode 조회할 상품 코드
	 * @return 조회된 Product VO
	 */
	Product getProductByCode(String productCode);
	
	/**
	 * 전체 상품의 갯수를 반환하는 메서드
	 * 페이지네이션에서 사용
	 * @return 전체상품 갯수
	 */
	int getTotalProductsRows();
	
	/**
	 * 인덱스에 부합하는 상품들을 반환하는 메서드
	 * @param pageInfo 페이지네이션 정보, 시작인덱스, 끝인덱스
	 * @return 조회된 상품들의 Product VO 리스트
	 */
	List<Product> getProductPagination(Map<String, Object> pageInfo);
	
	/**
	 * 모든 상품 카테고리를 반환하는 메서드
	 * @return String 리스트 
	 */
	List<String> getAllProductCategory();
	
	/**
	 * DB에 상품을 추가하는 메서드
	 * 관리자에서 사용
	 * @param product 등록할 상품의 Product Vo
	 */
	void insertProduct(Product product);
	
	/**
	 * DB에서 상품을 삭제하는 메서드
	 * 관리자에서 사용
	 * @param ProductCode 삭제할 상품의 상품코드
	 */
	void deleteProductByCode(String ProductCode);
	
	/**
	 * 상품의 정보를 업데이트 해주는 메서드
	 * @param product 업데이트 할 상품정보가 담긴 Product Vo
	 */
	void updateProduct(Product product);

	/**
	 * 결제완료 시 payment 테이블, gift_product 테이블에 정보를 저장하는 메서드
	 * @param paymentInfo 결제정보가 담긴 Map 객체
	 */
	void successPayment(Map<String, Object> paymentInfo);
	
	Map<String, Object> getUserPaymentGifts(int pageNo);
	
	Map<String, Object> getUserReceiveGifts(int pageNo);
	
}
