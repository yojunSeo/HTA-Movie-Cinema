package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.EventDao;
import com.hmc.dao.EventJoinDao;
import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;

@Service
public class EventJoinServiceImpl implements EventJoinService {
	
	@Autowired
	EventDao eventDao;
	
	@Autowired
	EventJoinDao eventJoinDao;

	@Override
	public void insertEventJoin(EventJoin eventJoin) {
		eventJoinDao.insertEventJoin(eventJoin);
		
	}

	@Override
	public void updateEventJoinResult(EventJoin eventJoin) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EventJoin> getEventJoinByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EventJoin> getEventJoinByEventCode(String eventCode) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void eventDraw(String eventCode) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<EventJoin> getUserIdAndResult(String eventCode) {
		List<EventJoin> joins = eventJoinDao.getUserIdAndResult(eventCode);
		return joins;
	}
	
	@Override
	public List<EventJoin> getEventJoinReSultByUserId(Map<String, Object> param) {
		List<EventJoin> joins = eventJoinDao.getEventJoinReSultByUserId(param);
		return joins;
	}
	
	@Override
	public Event getEventByCode(String eventCode) {
		return eventDao.getEventByCode(eventCode);
	}
	
	@Override
	public void updateEvent(Event event) {
		eventDao.updateEvent(event);
	}
}
