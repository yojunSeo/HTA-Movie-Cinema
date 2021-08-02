package com.hmc.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.MovieDao;
import com.hmc.vo.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDao movieDao;
	@Autowired
	MovieApiService movieApiService;
	  
	@Override
	public List<Movie> getMoiveInfo(){
		return movieDao.getMoiveInfo();
	}
	
	@Override
	public List<Movie> getMovieRanking(){
		return movieDao.getMovieRanking();
	}

	@Override
	public Movie getMoviebyCode(int movieCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveMoviesFromApi() {
		List<Movie> movies;
		try {
			movies = movieApiService.getMovieInfo();
			for (Movie movie : movies) {
				Movie savedMovie = movieDao.getMovieByCode(movie.getMovieCode());
				if (savedMovie == null) {
					movieDao.insertMovie(movie);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Movie> rankings;
		try {
			rankings = movieApiService.getMovieRanking();
			
			for (Movie ranking: rankings) {
				Movie savedMovie = movieDao.getMovieByCode(ranking.getMovieCode());
				if (savedMovie != null) {
					savedMovie.setRank(ranking.getRank());
					movieDao.updateMovie(savedMovie);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
		
}
	

	
	
	
//    public Connection getConnection() {
//    	String oracleDriver = "oracle.jdbc.OracleDriver";
//        String oracleUrl = "jdbc:oracle:thin:@db202107132355_high?TNS_ADMIN=C://OracleCloud";
//        String oracleId = "admin";
//        String oraclePwd = "$tH8Zg8*zhn#3RT";
//    	Connection con = null;
//    	try {
//			Class.forName(oracleDriver);
//			try {
//				con = DriverManager.getConnection(oracleUrl, oracleId, oraclePwd);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//    	return con;
//    }
//    @Override
//    public void insertMovie(Movie movie) {
//    	Connection con = null;
//    	ResultSet rs = null;
//    	PreparedStatement pstm =null;
//    	
//    	int res = 0;
//    	
//    	con = this.getConnection();
//    	
//    	String query = "INSERT INTO T_MOVIE VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
//
//    			try {
//    				System.out.println("====== 들어왓다 ======");
//    				System.out.println("get  ==> "+movie.getMovieCode());
//    				System.out.println("get  ==> "+movie.getReleaseDate());
//    				System.out.println("get  ==> "+movie.getMovieName());
//    				for (int i = 0; i < 10; i++) {
//    					pstm = con.prepareStatement(query);
//    					pstm.setInt(1, movie.getMovieCode());
//    					pstm.setDate(2, (java.sql.Date) movie.getReleaseDate());
//    					pstm.setString(3, movie.getMovieName());
//    					pstm.setInt(4, movie.getRunningTime());
//    					pstm.setString(5, movie.getGenre());
//    					pstm.setString(6, movie.getGrade());
//    					pstm.setString(7, movie.getCountry());
//    					pstm.setString(8, movie.getDirector());
//    					pstm.setString(9, movie.getCompany());
//    					pstm.setString(10, movie.getPoster());
//    					pstm.setString(11, movie.getSynopsis());
//    					pstm.setString(12, movie.getUrl());;
//    					pstm.setString(13, movie.getStillcut());
//    					pstm.setString(14, movie.getTrailer());
//    					pstm.setInt(15, movie.totalScore);
//    					pstm.setInt(16, movie.getReviewCnt());
//    					
//    					pstm.executeUpdate();
//    				}
//    			System.out.println("get  ==> "+movie.getMovieName());
//				System.out.println("====  나갓다  ====");
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//    }
//	@Override
//	public void insertMovie (Movie movie) {
//		movieDao.insertMovie(movie);
//	}
//}
