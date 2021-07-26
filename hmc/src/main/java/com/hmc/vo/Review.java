package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Review {
	
	private String code;
	private String screenCode;
	private String bookingCode;
	private String userId;
	private String content;
	private int score;
	private Date createdDate;
	private Date modifiedDate;
	private Date deletedDate;
	private String status;

}
