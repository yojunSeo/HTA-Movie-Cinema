package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {
	private String id;
	private String password;
	private String name;
	private String gender;
	private Date birthday;
	private String email;
	private String phone;
	private String grade;
	private int point;
	private String status;
	private Date createdDate;
	private Date withdrawalDate;
	private String adminYN;
	private String favoriteBranch1;
	private String favoriteBranch2;
	private String favoriteBranch3;
	
	
	

}
