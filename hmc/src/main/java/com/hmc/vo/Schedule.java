package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Schedule {

	private String code;
	private String screenCode;
	private String branchCode;
	private String roomCode;
	private Date scheduleDate;
	private Date startTime;
	private Date endTime;
	private int emptySeat;

}
