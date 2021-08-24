package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;

public interface EventJoinService {

	void insertEventJoin(EventJoin eventJoin);
	
	void updateEventJoinResult(EventJoin eventJoin);
	
	List<EventJoin> getEventJoinByUserId(String userId);
	
	List<EventJoin> getEventJoinByEventCode(String eventCode);
	
	void eventDraw(String eventCode);
	
	void updateEvent(Event event);
	

	List<EventJoin> getUserIdAndResult(String eventCode);
	
	List<EventJoin> getEventJoinReSultByUserId(Map<String, Object> param);
	
	Event getEventByCode(String eventCode);
}
