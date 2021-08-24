package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Event;
import com.hmc.vo.EventJoin;

public interface EventJoinDao {

	/**
	 * 이벤트 참여정보를 전달받아 데이터베이스에 저장한다.
	 * @param eventJoin 이벤트 참여정보
	 */
	void insertEventJoin(EventJoin eventJoin);
	
	/**
	 * 이벤트 당첨여부를 변경한다.
	 * @param eventJoin 변경할 이벤트 참여정보
	 */
	void updateEventJoinResult(EventJoin eventJoin);
	
	/**
	 * 전달받은 사용자 아이디로 그 사용자의 이벤트 참여 리스트를 반환한다.
	 * @param userId 사용자 아이디
	 * @return 사용자의 이벤트 참여 리스트
	 */
	List<EventJoin> getEventJoinByUserId(String userId);
	
	/**
	 * 전달받은 이벤트 코드로 그 이벤트의 참여정보들을 반환한다.
	 * @param eventCode 이벤트 코드
	 * @return 그 이벤트 코드의 참여 정보들
	 */
	List<EventJoin> getEventJoinByEventCode(String eventCode);
	

	List<Map<String, Object>> getUserEventJoin(String userId);

	void eventDraw(String eventCode);
	
	void eventDrawNo(String eventCode);
	
	void deleteEventJoin(String eventCode);
	
	String getUserIdByEventCode(String eventCode);
	
	List<EventJoin> getUserIdAndResult(String eventCode);
	
	List<EventJoin> getEventJoinReSultByUserId(Map<String, Object> param);

}
