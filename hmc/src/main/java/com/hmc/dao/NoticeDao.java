package com.hmc.dao;

import java.util.List;

import com.hmc.vo.Notice;

public interface NoticeDao {
	
	List<Notice> getAllNotices();
	
	List<Notice> getNoticesY();
	
	List<Notice> getNoticesI();
	
	Notice getNoticeByCode(String code);
	
	void insertNotice(Notice notice);
	
	void deleteNotice(Notice notice);
	
	void updateNotice(Notice notice);
	

}
