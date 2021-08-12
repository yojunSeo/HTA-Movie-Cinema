package com.hmc.web.form;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductForm {
	
	private String productCode;
	private String category;
	private String name;
	private int price;
	private int discountRate;
	private int stock;
	private String memo;
	private MultipartFile imageFile;
}
