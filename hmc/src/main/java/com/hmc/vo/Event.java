package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Event {

	private String code;
	private String couponCode;
	private String title;
	private String content;
	private String writer;
	private Date startDate;
	private Date endDate;
	private int couponAmount;
	private String status;
	private String name;
	
}
