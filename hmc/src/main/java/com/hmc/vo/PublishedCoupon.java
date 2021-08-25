package com.hmc.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date givenDate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String isUsed;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date usedDate;
}
