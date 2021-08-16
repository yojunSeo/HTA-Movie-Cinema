package com.hmc.service;

import java.util.List;

import com.hmc.vo.EventJoin;

public interface EventJoinService {

	void insertEventJoin(EventJoin eventJoin);
	
	void updateEventJoinResult(EventJoin eventJoin);
	
	List<EventJoin> getEventJoinByUserId(String userId);
	
	List<EventJoin> getEventJoinByEventCode(String eventCode);
	
}
