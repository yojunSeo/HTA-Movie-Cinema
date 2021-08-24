package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.EventDao;
import com.hmc.dao.EventJoinDao;
import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;
import com.hmc.vo.Notice;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	EventJoinDao eventJoinDao;
	
	@Override
	public List<Event> getAllEventList(Map<String, Object> param) {
		List<Event> events = eventDao.getAllEvents(param);
		return events;
	}
	
	@Override
	public void insertNewEvent(Event event) {
		eventDao.insertEvent(event);
		
	}
	
	@Override
	public void deleteEvent(Event event) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Event> eventListPage(Map<String, Object> param) {
		List<Event> events = eventDao.eventListPage(param);
		return events;
	}
	
	@Override
	public List<Event> eventListPageByProceeding(Map<String, Object> param) {
		List<Event> events = eventDao.eventListPageByProceeding(param);
		return events;
	}
	
	@Override
	public List<Event> eventListPageByEnd(Map<String, Object> param) {
		List<Event> events = eventDao.eventListPageByEnd(param);
		return events;
	}
	
	@Override
	public List<Event> eventListPageByWating(Map<String, Object> param) {
		List<Event> events = eventDao.eventListPageByWating(param);
		return events;
	}
	
	@Override
	public void insertEvent(Event event) {
		eventDao.insertEvent(event);
		
	}
	
	@Override
	public void updateEvent(Event event) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Event getEventByCode(String code) {
		Event event = eventDao.getEventByCode(code);
		return event;
	}
	
	@Override
	public Event getEventDetail(String eventCode) {
		// TODO Auto-generated method stub
		return eventDao.getEventByCode(eventCode);
	}
	
	@Override
	public Event eventDetail(String eventCode) {
		
		return eventDao.eventDetail(eventCode);
	}
	
	@Override
	public int getTotalRows(Map<String, Object> param) {
		int rows = eventDao.getTotalRows(param);
		return rows;
	}
	
	@Override
	public List<Map<String, Object>> getUserEventJoins(String userId) {
		return eventJoinDao.getUserEventJoin(userId);
	}
	
}
