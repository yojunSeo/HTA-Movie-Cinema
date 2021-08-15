package com.hmc.service;

import java.util.List;

import com.hmc.vo.Actor;

public interface ActorService {

	void insert(Actor actor);
	
	List<Actor> getAllActorByCode(String movieCode) throws Exception;
}
