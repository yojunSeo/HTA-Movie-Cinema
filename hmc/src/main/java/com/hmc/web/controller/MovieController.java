package com.hmc.web.controller;

import java.util.List;

import javax.print.DocPrintJob;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hmc.service.ActorService;
import com.hmc.service.MovieApiService;
import com.hmc.service.MovieService;
import com.hmc.service.ReviewService;
import com.hmc.vo.Actor;
import com.hmc.vo.Movie;
import com.hmc.vo.Review;


@Controller
@RequestMapping("/movie")
public class MovieController {

	private Logger logger = LogManager.getLogger(MovieController.class);
	
	@Autowired
	MovieService movieService;
	@Autowired
	MovieApiService movieApiService;
	@Autowired
	ActorService actorService;
	@Autowired
	ReviewService reviewService;
	
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
		System.out.println("########nowMovies: " + nowMovies);
		System.out.println("########commingMoives: " + commingMovies);
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
	public String detail (@RequestParam("movieCode") String movieCode, Model model) throws Exception {
		Movie movie = movieService.getMovieDetail(movieCode); 
		logger.debug("###########detail실행됨movie" +movie);
		model.addAttribute("movie", movie);
		
		int cnt = movie.getTotalScore();
		int total = movie.getReviewCnt();
		if (cnt!=0 || total!=0) {
			int reviewScoreAvg = cnt/total;
			model.addAttribute("reviewScoreAvg",reviewScoreAvg); 
			System.out.println("###########reviewScoreAvg: "+reviewScoreAvg); 
		}
				
		List<Actor> actors = actorService.getAllActorByCode(movieCode);
		model.addAttribute("actors", actors);
		logger.debug("###########detail실행됨actors:" +actors);
		
		List<Review> reviews = reviewService.getReviewByMovieCode(movieCode);
		System.out.println("##########detail실행됨reviews" + reviews);
		model.addAttribute("reviews", reviews);

		return "movie/detail";
	}
	
	@GetMapping("/now")
	public String now ( Model model) throws Exception {
		List<Movie> nowAllMovies = movieService.getNowAllMovies();
		model.addAttribute("nowAllMovies", nowAllMovies);
		return "movie/now";
	}
	
	@GetMapping("/commingsoon")
	public String commingsoon (Model model) throws Exception {
		List<Movie> commingAllMovies = movieService.getCommingAllMovies();
		model.addAttribute("commingAllMovies", commingAllMovies);
		return "movie/commingsoon";
	}
	
	
}
