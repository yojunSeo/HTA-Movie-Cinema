package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;

public interface EventService {
	
	void insertNewEvent(Event event);
	
	List<Event> getAllEventList(Map<String, Object> param);
	
	void insertEvent(Event event);
	
	void deleteEvent(Event event);
	
	void updateEvent(Event event);
	
	List<Event> eventListPage(Map<String, Object> param);
	
	List<Event> eventListPageByProceeding(Map<String, Object> param);
	
	List<Event> eventListPageByWating(Map<String, Object> param);
	
	List<Event> eventListPageByEnd(Map<String, Object> param);
	
	Event getEventByCode(String code);
	
	Event getEventDetail(String eventCode);
	
	int getTotalRows(Map<String, Object> param);
	
	Event eventDetail(String eventCode);
	
	List<Map<String, Object>> getUserEventJoins(String userId);
	
}
