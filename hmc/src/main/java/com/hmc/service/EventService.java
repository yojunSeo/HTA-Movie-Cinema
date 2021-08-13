package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Event;

public interface EventService {
	
	void insertNewEvent(Event event);
	
	List<Event> getAllEventList(Map<String, Object> param);
	
	void insertEvent(Event event);
	
	void deleteEvent(Event event);
	
	void updateEvent(Event event);
	
	List<Event> eventListPage(Map<String, Object> param);
	
	Event getEventByCode(String code);
	
	Event getEventDetail(String eventCode);
	
	int getTotalRows(Map<String, Object> param);
	
	Event eventDetail(String eventCode);
	
	
}
