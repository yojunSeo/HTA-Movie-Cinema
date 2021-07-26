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
	private int discount_rate;
	private int stock;
	private String memo;
	private Date createdDate;
}
