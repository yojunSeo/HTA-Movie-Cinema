package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Notice {
	
	private String code;
	private String category;
	private String writer;
	private String title;
	private String content;
	private Date createdDate;
	private Date modifiedDate;
	private String status;

}
