package com.hmc.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScreenMovie {
	
	private String code;
	private String movieCode;
	private String movieName;
	private int runningTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDate;

}
