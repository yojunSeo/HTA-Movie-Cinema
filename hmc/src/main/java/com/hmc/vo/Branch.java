package com.hmc.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Branch {

	private String code;
	private String name;
	private String info;
	private int facility;
	private String parkingInfo;
	private String status;
	private double latitude;
	private double longitude;
}
