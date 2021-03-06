package com.hmc.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Product {

	private String code;
	private String category;
	private String name;
	private int price;
	private int discountRate;
	private int stock;
	private String memo;
	private String imageFileName;
	private Date createdDate;

	public int getDiscountPrice() {
		int value = ((int) Math.round(price*(1-(discountRate*0.01) )/100))*100;
		return value;
	}
}

