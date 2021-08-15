package com.hmc.service;

import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hmc.dao.ActorDao;
import com.hmc.dao.MovieDao;
import com.hmc.vo.Actor;
import com.hmc.vo.Movie;

@Service
public class ActorServiceImpl implements ActorService {

	@Autowired
	ActorDao actorDao;
	
	@Autowired
	MovieDao movieDao;
	
	String movieDetailUrl = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=";
	String AUTH_KEY = "b5dd3da81db2d6020a6151195126a153";
	
	@Override
	public List<Actor> getAllActorByCode(String movieCode) throws Exception {
		JsonObject object = getMovieActor(movieCode);
		System.out.println("#############34object : " + object);
		String code = object.get("movieCd").getAsString();
		System.out.println("#############36code : " + code);
		JsonArray array = object.getAsJsonArray("actors");
		System.out.println("#############38array : " + array);
		
		Actor savedCode = actorDao.getSavedMovieCode(movieCode);
		System.out.println("#############41savedCode : " + savedCode);
		if(savedCode == null) {
			for (int i=0; i<array.size(); i++) {
				JsonObject moiveObject = (JsonObject) array.get(i);
				System.out.println("##########42movieObject : " +moiveObject);
				String actorName = moiveObject.get("peopleNm").getAsString();
				System.out.println("##########actorName: " + actorName);
				String roll = moiveObject.get("cast").getAsString();
				System.out.println("#########roll: " + roll);
				Actor actor = new Actor();
				actor.setMovieCode(code);
				actor.setActorName(actorName);
				actor.setRoll(roll);
				
				actorDao.insertActor(actor);
				System.out.println("###########actor:"+actor);
			}
			
		}
		
		return actorDao.getAllActorByCode(movieCode);
	}
	
	private JsonObject getMovieActor(String movieCode) throws Exception {
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
	
	@Override
	public void insert(Actor actor) {
		// TODO Auto-generated method stub
		
	}


}
