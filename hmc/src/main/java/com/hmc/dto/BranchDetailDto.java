package com.hmc.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BranchDetailDto {
	
	private String branchCode;
	private String branchName;
	private String branchInfo;
	private int totalRoom;
	private int totalSeat;
	private String address;
	private int facility;
	private String parkingInfo;
	
}
