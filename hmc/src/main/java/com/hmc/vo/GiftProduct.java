package com.hmc.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GiftProduct {

	private String code;
	private String paymentCode;
	private String productCode;
	private String giveUser;
	private String receiveUser;
	private int price;
	private int amount;
	private Date endDate;
	private Date purchasedDate;
	private String isUsed;
	private Date usedDate;
	
}
