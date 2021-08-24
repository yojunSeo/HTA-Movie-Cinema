package com.hmc.web.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventForm {
	
	private String title;
	private String writer;
	private String eventContent;
	private String startDate;
	private String endDate;
	private String selectCoupon;
	private int couponAmount;
	private String status;

}
