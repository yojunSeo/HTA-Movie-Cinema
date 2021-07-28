package com.hmc.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Room {

	private String code;
	private String name;
	private String branchCode;
	private int totalSeat;
	private String status;

}
