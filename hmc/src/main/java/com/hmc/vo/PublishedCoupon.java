package com.hmc.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PublishedCoupon {

	private String code;
	private String couponCode;
	private String userId;
	private Date givenDate;
	private Date endDate;
	private String isUsed;
	private Date usedDate;
}
