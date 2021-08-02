package com.hmc.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.MovieApiService;
import com.hmc.service.MovieService;
import com.hmc.vo.Movie;
import com.hmc.web.util.SessionUtils;



@Controller
@RequestMapping("/movie")
public class MovieController {

	private Logger logger = LogManager.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;
	@Autowired
	private MovieApiService movieApiService;
	
	/**
	 * API 요청값 조회  및 저장
	 * @param movie
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public String MovieList (Movie movie) throws Exception{
		try {
			MovieApiService movieApiService = new MovieApiService();
			// 상세정보api 조회
			movieApiService.getMovieInfo();
			// 순위정보api 조회
			movieApiService.getMovieRanking();	
			// db저장
			movieService.saveMoviesFromApi();
			
			} catch (Exception e) {
			}
			
		return "movie/home";
	}
	
	/**
	 * 뷰에 영화상세정보 전달
	 * @param movieCode
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/detail")
	public String detail (@RequestParam("movieCode") int movieCode, Model model) throws Exception {
		
		List<Movie> movie = movieApiService.getMovieInfo();
		model.addAttribute("movie", movie);
		
		return "movie/detail";
	}
	
}
