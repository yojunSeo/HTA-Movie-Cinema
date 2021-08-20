package com.hmc.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Movie {

	private String movieCode;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date releaseDate;
	private String movieName;
	private int runningTime;
	private String genre;
	private String grade;
	private String country;
	private String director;
	private String company;
	private String poster;
	private String synopsis;
	private String stillcut1;
	private String stillcut2;
	private String stillcut3;
	private String stillcut4;
	private String trailer;
	private int totalScore;
	private int reviewCnt;
	private int rank;
	private String audiacc;

}
