package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Booking {
	
	private String code;
	private String scheduleCode;
	private String userId;
	private String paymentCode;
	private Date bookingDate;
	private int count;
	private int price;
	private int discountPrice;
	private int totalPrice;
	private String status;

}
