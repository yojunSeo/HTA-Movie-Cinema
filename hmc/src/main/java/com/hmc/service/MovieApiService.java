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

				System.out.println("###############45번째라인 무비코드: " + movieCode + ", 무비네임: " + movieName);

				Movie movie = new Movie();
				movie.setMovieCode(movieCode);
				movie.setMovieName(movieName);
				
				System.out.println("#############53번째라인: "+movie);
				
				JsonObject movieInfo = getMovieDetail(movieCode);

				/// 1. 러닝타임 
				String runningTime = "0";
				if(!"".equals(movieInfo.get("showTm"))) {
					runningTime= movieInfo.get("showTm").getAsString();
					int showTm = Integer.parseInt(runningTime);
					movie.setRunningTime(showTm);
					System.out.println("############러닝타임:  "+runningTime); //-->ok
					System.out.println("############쇼타임:  "+showTm);
				}
				System.out.println(movie);
				
				/// 2. 장르 
				String genre = ((JsonObject) (movieInfo.get("genres").getAsJsonArray().get(0))).get("genreNm").getAsString();
				System.out.println("##########장르: "+genre); //->ok
				movie.setGenre(genre);
				System.out.println(movie);
				
				/// 3. 관람등급
				JsonArray gradeArray = ((JsonArray) (movieInfo.get("audits").getAsJsonArray()));
				System.out.println("######### gradArray: " + gradeArray);
				if(!gradeArray.isEmpty() || gradeArray.size() != 0) {
					System.out.println(gradeArray);
					String grade = ((JsonObject) (movieInfo.get("audits").getAsJsonArray().get(0))).get("watchGradeNm").getAsString();
					movie.setGrade(grade);
					System.out.println("#########관람 등급:  "+grade);
				}
				System.out.println(movie);

				/// 4. 제작국가
				String country = ((JsonObject) (movieInfo.get("nations").getAsJsonArray().get(0))).get("nationNm").getAsString();
				System.out.println("##########74번째라인 국가: "+country);
				movie.setCountry(country);
				System.out.println(movie);
				
				/// 5. 감독
				JsonArray directorArray = ((JsonArray) (movieInfo.get("directors").getAsJsonArray()));
				if (!directorArray.isEmpty()) {
					System.out.println(directorArray);
					String director = ((JsonObject) (movieInfo.get("directors").getAsJsonArray().get(0))).get("peopleNm").getAsString();
					movie.setDirector(director);
					System.out.println("##########76번째라인 감독: "+director);
				}
				System.out.println(movie);
				
				/// 6. 제작사
				JsonArray companyArray = ((JsonArray) (movieInfo.get("companys").getAsJsonArray()));
				if (!companyArray.isEmpty()) {
					System.out.println(companyArray);
					String company = ((JsonObject) (movieInfo.get("companys").getAsJsonArray().get(0))).get("companyNm").getAsString();
					movie.setCompany(company);
					System.out.println("##########78번째라인 제작사: "+company);
				}
				System.out.println(movie);
				
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

				DateFormatter formatter = new DateFormatter("yyyy-MM-dd");
				if (releaseDate !=null ) {
					Date date = formatter.parse(releaseDate, Locale.KOREA);
					movie.setReleaseDate(date);
				}

				String rank = ((JsonObject) (movieRank.getAsJsonArray().get(0))).get("rank").getAsString();
				String audiAcc = ((JsonObject) (movieRank.getAsJsonArray().get(0))).get("audiAcc").getAsString();

				System.out.println(rank + ", " + audiAcc);

				movie.setRank(rank);
				movie.setAudiAcc(audiAcc);

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
		System.out.println("###########getMovieList: " +obj);
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



