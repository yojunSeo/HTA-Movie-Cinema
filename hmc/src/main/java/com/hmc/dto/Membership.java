package com.hmc.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Membership {
	
	private String cp5000;
	private String cpMovie;
	private int cp5000Repeat;
	private int cpMovieRepeat;
	private int savedPoint;
	private double savedRate;

}
