package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Actor;

public interface ActorDao {

	void insertActor (Actor actor);
	
	List<Actor> getAllActorByCode(String MovieCode);
	
	Actor getSavedMovieCode(String movieCode);
}
