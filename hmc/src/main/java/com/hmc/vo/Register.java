package com.hmc.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Register {
	
	private String id;
	private String password;
	private String confirmPassword;
	private String name;
	private String email;
	private String gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String phone;

}
