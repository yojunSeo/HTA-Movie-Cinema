package com.hmc.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BookingDetail {
	
	private String bookingCode;
	private String userId;
	private String scheduleCode;
	private String usedCoupon;
	private String bookedSeats;
	private int usedPoint;
	private int savedPoint;

}
