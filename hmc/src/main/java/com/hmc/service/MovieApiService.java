package com.hmc.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hmc.dao.MovieDao;
import com.hmc.vo.Movie;

import oracle.jdbc.driver.OracleDriver;

@Service
public class MovieApiService {

	@Autowired
	MovieDao movieDao;
	
	String movieListURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f5eef3421c602c6cb7ea224104795888";
	String movieDetailUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=";
	String movieRankUrlString = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=";
	String AUTH_KEY = "b5dd3da81db2d6020a6151195126a153";
	
	public void saveMoviesFromApi() throws Exception {
		// 영화목록정보만 조회
				JsonArray array = getMovieList();
				
				for (int i=0; i<array.size(); i++) {
					// 영화목록에서 순서대로 영화정보 조회
					JsonObject movieSimple =  (JsonObject) array.get(i);
					
					// 기본적인 영화정보를 조회한다.
					int movieCd = movieSimple.get("movieCd").getAsInt();
					String movieNm = movieSimple.get("movieNm").getAsString();
					
					// 획득한 영화코드로 데이터베이스에서 영화정보 조회
					Movie savedMovie = movieDao.getMovieByCode(movieCd);
					if (savedMovie == null) {
					 	JsonObject movieInfo = getMovieDetail(movieCd);
					 	String genre = ((JsonObject) (movieInfo.get("genres").getAsJsonArray().get(0))).get("genreNm").getAsString();
					 	
					 	System.out.println(movieCd + ", " + movieNm + ", " + genre );
						
					 	Movie movie = new Movie();
					 	movie.setMovieCode(movieCd);
					 	movie.setMovieName(movieNm);
					 	movie.setGenre(genre);
					 	
					 	movieDao.insertMovie(movie);
					 	System.out.println(movie);
					}		
				}
	}
	private JsonObject getMovieDetail(int movieCd) {
		// TODO Auto-generated method stub
		return null;
	}
	private JsonArray getMovieList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<Movie> getMovieInfo() throws Exception {
	
		
		return null;
	}
	// 영화순위정보 api 받아오기
	public List<Movie> getMovieRanking() throws Exception {
		String REQUEST_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
		String AUTH_KEY = "b5dd3da81db2d6020a6151195126a153";
		
		// 오늘 날짜 조회
		Calendar cal = Calendar.getInstance();
		int day = cal.get(Calendar.DAY_OF_MONTH);
		// 어제 날짜 조회(박스오피스 조회할 날짜)
		cal.set(Calendar.DAY_OF_MONTH, day - 1);
		Date yesterday = cal.getTime();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String targetDate = sdf.format(yesterday);

		 // 변수 설정
        //   - 요청(Request) 인터페이스 Map
        //   - 어제자 다양성 한국영화 10개 조회
		Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("key"          , AUTH_KEY);                        // 발급받은 인증키
        paramMap.put("targetDt"     , sdf.format(yesterday));  // 조회하고자 하는 날짜
        paramMap.put("itemPerPage"  , "10");                            // 결과 ROW 의 개수( 최대 10개 )
        paramMap.put("multiMovieYn" , "Y");                             // Y:다양성 영화, N:상업영화, Default:전체
        paramMap.put("repNationCd"  , "K");                             // K:한국영화, F:외국영화, Default:전체
 
        try {
            // Request URL 연결 객체 생성
            URL requestURL = new URL(REQUEST_URL+"?"+makeQueryString(paramMap));
            HttpURLConnection conn = (HttpURLConnection) requestURL.openConnection();
 
            // GET 방식으로 요청
            conn.setRequestMethod("GET");
            conn.setDoInput(true);
 
            // 응답(Response) 구조 작성
            //   - Stream -> JSONObject
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String readline = null;
            StringBuffer response = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                response.append(readline);
            }
 
            // JSON 객체로  변환
            JSONObject responseBody = new JSONObject(response.toString());
           
            // 데이터 추출
            JSONObject boxOfficeResult = responseBody.getJSONObject("boxOfficeResult");
 
            // 박스오피스 주제 출력
            String boxofficeType = boxOfficeResult.getString("boxofficeType");
            System.out.println(boxofficeType);
 
            // 박스오피스 목록 출력
            JSONArray dailyBoxOfficeList = boxOfficeResult.getJSONArray("dailyBoxOfficeList");
            Iterator<Object> iter = dailyBoxOfficeList.iterator();
            while(iter.hasNext()) {
                JSONObject boxOffice = (JSONObject) iter.next();
                System.out.printf("  %s - %s\n", boxOffice.get("rnum"), boxOffice.get("movieNm"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		return null;
    }
		
	
 
  
 
    // Map -> QueryString
    public String makeQueryString(Map<String, String> paramMap) {
        final StringBuilder sb = new StringBuilder();
 
        paramMap.entrySet().forEach(( entry )->{
            if( sb.length() > 0 ) {
                sb.append('&');
            }
            sb.append(entry.getKey()).append('=').append(entry.getValue());
        });
 
        return sb.toString();
    }
}



