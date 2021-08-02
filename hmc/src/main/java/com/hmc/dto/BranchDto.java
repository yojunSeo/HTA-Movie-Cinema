package com.hmc.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BranchDto {
	
	private String branchCode;
	private String branchName;
	private List<ScheduleDetail> schedules;

}
