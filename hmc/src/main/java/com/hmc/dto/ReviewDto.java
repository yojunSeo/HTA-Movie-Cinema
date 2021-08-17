package com.hmc.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDto {

	private String movieCode;
	private String userId;
	private String content;
	private int score;
	private Date createdDate;
}
