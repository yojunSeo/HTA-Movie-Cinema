package com.hmc.web.controller;

import java.util.List;

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


@Controller
@RequestMapping("/movie")
public class MovieController {

	private Logger logger = LogManager.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;
	@Autowired
	private MovieApiService movieApiService;

	private String movieCode;
	
	/**
	 * API 요청값 조회  및 저장
	 * @param movie
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/home")
	public String home (Model model) throws Exception{
		//movieService.saveMoviesFromApi();
		movieApiService.updateMovieRanking();
		List<Movie> nowMovies = movieService.getNowMovie();
		List<Movie> commingMovies = movieService.getCommingMovie();
		model.addAttribute("nowMovies", nowMovies);
		model.addAttribute("commingMovies", commingMovies);
		logger.debug("###########실행됨");
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
	public String detail (@RequestParam(value="movieCode", required = false) String movieCode, Model model) throws Exception {
		System.out.println("code ???  "+movieCode);
		model.addAttribute("movie", movieService.getMovieDetail(movieCode));
		
		return "movie/detail";
	}
	
	@GetMapping("/now")
	public String now (@RequestParam(value="rank", required = false, defaultValue = "10") int rank, Model model) throws Exception {
		List<Movie> topMovies = movieService.getTopMovies(rank);
		model.addAttribute("movie", topMovies);
		return "movie/now";
	}
	
	
	
}
