package com.hmc.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleDetail {

	private String scheduleCode;
	private String screenCode;
	private String movieName;
	private String poster;
	private int runningTime;
	private String branchCode;
	private String branchName;
	private String roomCode;
	private int totalSeat;
	private String roomName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date scheduleDate;
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(pattern = "HH:mm" , locale = "ko" , timezone = "Asia/Seoul")
	private Date startTime;
	@DateTimeFormat(pattern = "HH:mm")
	@JsonFormat(pattern = "HH:mm" , locale = "ko" , timezone = "Asia/Seoul")
	private Date endTime;
	private int emptySeat;
	private String movieGrade;
}
