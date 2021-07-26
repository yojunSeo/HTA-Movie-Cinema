package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EventJoin {

	private String eventCode;
	private String userId;
	private Date entryDate;
	private String result;
	
}
