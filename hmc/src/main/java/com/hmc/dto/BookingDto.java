package com.hmc.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookingDto {

	private String exceptGrade;
	private String scheduleCode;
	private String[] seatCode;
	private int basePrice;
	private int disCountPrice;
	private int totalPrice;
	private int savedPoint;
	private int usedPoint;
	private String usedCoupon;
}
