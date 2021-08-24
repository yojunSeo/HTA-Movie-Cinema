package com.hmc.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventJoin {

	private String eventCode;
	private String userId;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date entryDate;
	private String result;
	
}
