package com.hmc.dao;

import java.util.List;

import com.hmc.vo.GiftProduct;

public interface GiftProductDao {

	void insertGiftProduct(GiftProduct giftProduct);
	
	List<GiftProduct> getMyGiftProduct(String userCode);
	
	void updateUsedStatusToY(String giftCode);
}
