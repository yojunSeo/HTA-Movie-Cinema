package com.hmc.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BranchScheduleDto {
	
	private String branchCode;
	private String branchName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date screenDate;
	private List<MovieDto> movies;
	
}
