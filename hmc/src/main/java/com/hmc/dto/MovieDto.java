package com.hmc.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieDto {
	
	private String screenCode;
	private String movieName;
	private List<ScheduleDetail> schedules;

}
