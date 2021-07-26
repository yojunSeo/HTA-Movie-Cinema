package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Inquery {

	private String code;
	private String userId;
	private String category;
	private String title;
	private String content;
	private String branchCode;
	private Date createdDate;
	private String responder;
	private String respondContent;
	private Date respondDate;
	private String respondStatus;
	

}
