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
	
	@SuppressWarnings("unlikely-arg-type")
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
				
				Movie movie = new Movie();
				movie.setMovieCode(movieCode);
				movie.setMovieName(movieName);
				JsonObject movieInfo = getMovieDetail(movieCode);

				/// 1. 러닝타임 
				String runningTime = "0";
				if(!"".equals(movieInfo.get("showTm"))) {
					runningTime= movieInfo.get("showTm").getAsString();
					int showTm = Integer.parseInt(runningTime);
					movie.setRunningTime(showTm);
				}
				
				/// 2. 장르 
				String genre = ((JsonObject) (movieInfo.get("genres").getAsJsonArray().get(0))).get("genreNm").getAsString();
				movie.setGenre(genre);
				
				/// 3. 관람등급
				JsonArray gradeArray = ((JsonArray) (movieInfo.get("audits").getAsJsonArray()));
				if(!gradeArray.isEmpty() || gradeArray.size() != 0) {
					String grade = ((JsonObject) (movieInfo.get("audits").getAsJsonArray().get(0))).get("watchGradeNm").getAsString();
					movie.setGrade(grade);
				}

				/// 4. 제작국가
				String country = ((JsonObject) (movieInfo.get("nations").getAsJsonArray().get(0))).get("nationNm").getAsString();
				movie.setCountry(country);
				
				/// 5. 감독
				JsonArray directorArray = ((JsonArray) (movieInfo.get("directors").getAsJsonArray()));
				if (!directorArray.isEmpty()) {
					String director = ((JsonObject) (movieInfo.get("directors").getAsJsonArray().get(0))).get("peopleNm").getAsString();
					movie.setDirector(director);
				}
				
				/// 6. 제작사
				JsonArray companyArray = ((JsonArray) (movieInfo.get("companys").getAsJsonArray()));
				if (!companyArray.isEmpty()) {
					String company = ((JsonObject) (movieInfo.get("companys").getAsJsonArray().get(0))).get("companyNm").getAsString();
					movie.setCompany(company);
				}				
				movieDao.insertMovie(movie);
			}		
			
			
		}
	}
	public void updateMovieRanking() throws Exception{
		movieDao.resetMovieRanking();
		// 데일리영화박스오피스리스트 조회
		JsonArray array = getMovieRank();
		for (int i=0; i<array.size(); i++) {
			// 데일리영화박스오피스리스트에서 순서대로 영화정보 조회
			JsonObject movieObject =  (JsonObject) array.get(i);
			// 순위에 해당하는 영화코드를 조회한다.
			String movieCode = movieObject.get("movieCd").getAsString();
			// 획득한 영화코드로 데이터베이스에서 영화정보 조회
			Movie savedMovie = movieDao.getMovieInfoByCode(movieCode);
			if (savedMovie != null) {
				Movie movie = new Movie();
				JsonArray movieRank = getMovieRank();
				// 개봉일 
				String releaseDate = movieObject.get("openDt").getAsString();
				DateFormatter formatter = new DateFormatter("yyyy-MM-dd");
				if (releaseDate !=null ) {
					Date date = formatter.parse(releaseDate, Locale.KOREA);
					movie.setReleaseDate(date);
				}
				// 영화예매순위
				String rank = movieObject.get("rank").getAsString();
				int ranking = Integer.parseInt(rank);
				// 누적관객수
				String audiAcc = movieObject.get("audiAcc").getAsString();
				
				movie.setMovieCode(movieCode);
				movie.setRank(ranking);
				
				movie.setAudiacc(audiAcc);
				
				movieDao.updateMovie(movie);
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
		// 영화상세정보만 조회
		JsonObject movieInfo = obj.getAsJsonObject("movieInfoResult").getAsJsonObject("movieInfo");

		return movieInfo;
	}
	
	private JsonArray getMovieRank() throws Exception {
		// 어제 날짜 조회
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
		// 영화목록정보만 조회
		JsonArray rankArray = obj.getAsJsonObject("boxOfficeResult").getAsJsonArray("dailyBoxOfficeList");
		return rankArray;
	}
}



