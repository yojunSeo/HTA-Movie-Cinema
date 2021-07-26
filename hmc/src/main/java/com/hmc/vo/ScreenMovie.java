package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScreenMovie {
	
	private String code;
	private String movieCode;
	private Date startDate;
	private Date endDate;

}
