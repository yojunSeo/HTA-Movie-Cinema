package com.hmc.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Seat {

	private String code;
	private String branchCode;
	private String roomCode;
	private String row;
	private int col;
	private String type;

}
