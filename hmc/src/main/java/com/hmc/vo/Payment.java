package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Payment {
	
	private String code;
	private String userId;
	private int price;
	private Date paymentDate;
	private String way;
	private String status;
	
}
