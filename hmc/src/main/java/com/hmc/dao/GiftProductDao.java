package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.GiftProduct;

public interface GiftProductDao {

	void insertGiftProduct(GiftProduct giftProduct);
	
	List<GiftProduct> getMyGiftProduct(String userCode);
	
	GiftProduct getGiftProductByCode(String giftCode);
	
	void updateUsedStatusToY(String giftCode);
	
	List<Map<String, Object>> getMyPaymentGift(Map<String, Object> param);
	
	List<Map<String, Object>> getMyReceiveGift(Map<String, Object> param);
	
	int getMyPaymentGiftCnt(String userId);
	
	int getMyReceiveGiftCnt(String userId);
	
	void deleteGiftByCode(String giftCode);
	
}
