package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Event;

public interface EventDao {

	/**
	 * 이벤트 정보를 데이터베이스에 저장한다. 
	 * @param event 저장할 이벤트 정보
	 */
	void insertEvent(Event event);
	
	/**
	 * 이벤트 번호와 이벤트 상태를 전달받아 이벤트의 상태를 변경한다.
	 * condition.put("eventCode" , eventCode);
	 * condition.put("status" , status);	-> 'Y' , 'N' , 'B' 중 하나
	 * 형태로 Map에 넣어서 전달
	 * @param condition Map객체
	 */
	void updateEventStatus(Map<String, String> condition);
	
	/**
	 * 전달받은 정보로 이벤트를 변경한다.
	 * @param event 변경된 정보를 담고있는 Event 객체
	 */
	void updateEvent(Event event);
	
	/**
	 * 데이터베이스에 저장된 모든 이벤트들을 반환한다.
	 * @return 모든 이벤트 정보
	 */
	List<Event> getAllEvents(Map<String, Object> param);
	
	/**
	 * 이벤트 코드를 전달받아 해당되는 이벤트 상세정보를 반환한다.
	 * @param eventCode 이벤트 코드
	 * @return 해당되는 이벤트 정보
	 */
	Event getEventByCode(String eventCode);
	
	/**
	 * 이벤트 페이징 처리
	 * @param param
	 * @return
	 */
	List<Event> eventListPage(Map<String, Object> param);
	
	List<Event> eventListPageByProceeding(Map<String, Object> param);
	
	List<Event> eventListPageByWating(Map<String, Object> param);
	
	List<Event> eventListPageByEnd(Map<String, Object> param);
	
	
	
	
	int getTotalRows(Map<String, Object> param);
	
	Event eventDetail(String eventCode);
	
	void deleteEvent(String eventCode);
	
	void updateStatus();
	
	void updateEventCodeIsNull(String code);
}
