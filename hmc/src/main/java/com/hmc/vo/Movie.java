package com.hmc.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Movie {

	public int movieCode;
	public Date releaseDate;
	public String movieName;
	public int runningTime;
	public String genre;
	public String grade;
	public String country;
	public String director;
	public String company;
	public String poster;
	public String synopsis;
	public String url;
	public String stillcut;
	public String trailer;
	public int rank;
	public int totalScore;
	public int reviewCnt;
}
