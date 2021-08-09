package com.hmc.service;


import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hmc.dao.MovieDao;
import com.hmc.vo.Movie;

@Service
public class MovieApiService {

	@Autowired
	MovieDao movieDao;
	
	String movieListURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f5eef3421c602c6cb7ea224104795888";
	String movieDetailUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=";
	String movieRankUrl = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=";
	String AUTH_KEY = "b5dd3da81db2d6020a6151195126a153";
	
	public void saveMoviesFromApi() throws Exception {
		// 영화목록정보만 조회
		JsonArray array = getMovieList();

		for (int i=0; i<array.size(); i++) {
			// 영화목록에서 순서대로 영화정보 조회
			JsonObject movieObject =  (JsonObject) array.get(i);
			// 기본적인 영화정보를 조회한다.
			String movieCode = movieObject.get("movieCd").getAsString();

			// 획득한 영화코드로 데이터베이스에서 영화정보 조회
			Movie savedMovie = movieDao.getMovieInfoByCode(movieCode);
			
			if (savedMovie == null) {
				String movieName = movieObject.get("movieNm").getAsString();

				System.out.println("###############45번째라인:무비코드 " + movieCode + ", 무비네임 " + movieName);

				Movie movie = new Movie();
				movie.setMovieCode(movieCode);
				movie.setMovieName(movieName);
				
				movieDao.insertMovie(movie);
				System.out.println("#############53번째라인: "+movie);
			}		
			if (savedMovie != null) {
				Movie movie = new Movie();
				JsonObject movieInfo = getMovieDetail(movieCode);
				//relaseDate가 null이면 어떻게 해야하는지? 저장안하고 넘길방법은 없는지? 
				String releaseDate = movieInfo.get("openDt").getAsString();
				System.out.println("########## 67번째 라인 date" +releaseDate);
								
				DateFormatter formatter = new DateFormatter("yyyyMMdd");
				if (releaseDate !=null ) {
					Date date = formatter.parse(releaseDate, Locale.KOREA);
					movie.setReleaseDate(date);
				}
				int runningTime = movieInfo.get("showTm").getAsInt();
				System.out.println("############68번째라인: 러닝타임"+runningTime); //-->ok
				String genre = ((JsonObject) (movieInfo.get("genres").getAsJsonArray().get(0))).get("genreNm").getAsString();
				System.out.println("##########70번째라인:장르 "+genre); //->ok
				String grade = ((JsonObject) (movieInfo.get("audits").getAsJsonArray().get(1))).get("watchGradeNm").getAsString();
				System.out.println("##########72번째라인:등급  "+grade);
				String country = ((JsonObject) (movieInfo.get("nations").getAsJsonArray().get(0))).get("nationNm").getAsString();
				System.out.println("##########74번째라인:국가 "+country);
				String director = ((JsonObject) (movieInfo.get("directors").getAsJsonArray().get(0))).get("peopleNm").getAsString();
				System.out.println("##########76번째라인:감독"+director);
				String company = ((JsonObject) (movieInfo.get("companys").getAsJsonArray().get(1))).get("companyNm").getAsString();
				System.out.println("##########78번째라인:제작사 "+company);
				//String rank = ((JsonObject) (boxofficeType.get("rank"))).getAsString();
				//String audAcc = ((JsonObject) (boxofficeType.get("audiAcc"))).getAsString();

				//System.out.println("##################상세정보조회목록#############"+movieCode + ", " + runningTime+ ", " + genre+ ", " 
				//		 + country+ ", " + director);

				movie.setMovieCode(movieCode);
				movie.setRunningTime(runningTime);
				movie.setGenre(genre);
				movie.setGrade(grade);
				movie.setCountry(country);
				movie.setDirector(director);
				movie.setCompany(company);

				movieDao.insertMovie(movie);
				System.out.println("########상세정보저장한내용######"+movie);
			}
			
		}
	}
	public void updateMovieRanking() throws Exception{
		JsonArray array = getMovieList();

		for (int i=0; i<array.size(); i++) {
			// 영화목록에서 순서대로 영화정보 조회
			JsonObject movieObject =  (JsonObject) array.get(i);
			// 기본적인 영화정보를 조회한다.
			String movieCode = movieObject.get("movieCd").getAsString();

			// 획득한 영화코드로 데이터베이스에서 영화정보 조회
			Movie savedMovie = movieDao.getMovieInfoByCode(movieCode);
			if (savedMovie == null) {
				Movie movie = new Movie();
				//JsonObject movieRankObject =  (JsonObject) array.get(i);
				JsonArray movieRank = getMovieRank(movieCode);
				//relaseDate가 null이면 어떻게 해야하는지? 저장안하고 넘길방법은 없는지? 
				//String releaseDate = movieRank.get("openDt").getAsInt();
				String releaseDate = ((JsonObject) (movieRank.getAsJsonArray().get(1))).get("openDt").getAsString();
				System.out.println("########## 67번째 라인 date" +releaseDate);

				DateFormatter formatter = new DateFormatter("yyyyMMdd");
				if (releaseDate !=null ) {
					Date date = formatter.parse(releaseDate, Locale.KOREA);
					movie.setReleaseDate(date);
				}

				String rank = ((JsonObject) (movieRank.getAsJsonArray().get(1))).get("rank").getAsString();
				String audiAcc = ((JsonObject) (movieRank.getAsJsonArray().get(1))).get("audiAcc").getAsString();

				System.out.println(rank + ", " + audiAcc);

				movie.setRank(rank);
				movie.setAudiAcc(audiAcc);

				movieDao.insertMovie(movie);
				movieDao.updateMovie(savedMovie);
				System.out.println("##########랭크" +movie);
			}	
		}
	}

	private JsonArray getMovieList() throws Exception{
		// 영화목록 주소로 URL 객체 생성
		URL url = new URL(movieListURL);
		// 영화목록 정보를 읽어오는 스트림 생성
		Reader reader = new InputStreamReader(url.openStream(), "utf-8");

		Gson gson = new Gson();
		// 영화정보를 읽어와서 JsonObject객체에 저장
		JsonObject obj = gson.fromJson(reader, JsonObject.class);
		reader.close();
		System.out.println("###########getMoviList: " +obj);
		// 영화목록정보만 조회
		JsonArray array = obj.getAsJsonObject("movieListResult").getAsJsonArray("movieList");
		return array;
	}

	private JsonObject getMovieDetail(String movieCode) throws Exception{
		// 영화상세정보 주소로 URL 객체 생성
		URL url = new URL(movieDetailUrl + movieCode);
		// 영화상세정보를 읽어오는 스트림 생성
		Reader reader = new InputStreamReader(url.openStream(), "utf-8");

		Gson gson = new Gson();
		// 영화상세정보를 읽어와서 JsonObject객체에 저장
		JsonObject obj = gson.fromJson(reader, JsonObject.class);
		reader.close();
		System.out.println("###########getMovieDetail: "+obj);
		// 영화상세정보만 조회
		JsonObject movieInfo = obj.getAsJsonObject("movieInfoResult").getAsJsonObject("movieInfo");

		return movieInfo;
	}
	
	private JsonArray getMovieRank(String movieCode) throws Exception {
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, day - 1);
		Date yesterday = cal.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String targetDate = sdf.format(yesterday);
		// 영화박스오피스 주소로 URL 객체 생성
		URL url = new URL(movieRankUrl + targetDate);
		// 영화박스오피스 정보를 읽어오는 스트림 생성
		Reader reader = new InputStreamReader(url.openStream(), "utf-8");

		Gson gson = new Gson();
		// 영화정보를 읽어와서 JsonObject객체에 저장
		JsonObject obj = gson.fromJson(reader, JsonObject.class);
		reader.close();
		System.out.println("###########getMovieRank: "+obj);
		// 영화목록정보만 조회
		JsonArray rankArray = obj.getAsJsonObject("boxOfficeResult").getAsJsonArray("dailyBoxOfficeList");
		return rankArray;
	}

	



}



