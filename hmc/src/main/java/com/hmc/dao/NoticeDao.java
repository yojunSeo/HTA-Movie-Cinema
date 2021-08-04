package com.hmc.dao;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Notice;

public interface NoticeDao {
	
	List<Notice> getAllNotices(Map<String, Object> param);
	
	Notice getNoticeByCode(String code);
	
	void insertNotice(Notice notice);
	
	void deleteNotice(String code);
	
	void updateNotice(Notice notice);
	
	int getTotalRows(Map<String, Object> param);
	

}
