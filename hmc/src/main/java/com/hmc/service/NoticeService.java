package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.vo.Inquery;
import com.hmc.vo.Notice;

public interface NoticeService {

	List<Notice> getAllNotices(Map<String, Object> param);

	Notice getNoticeByCode(String code);

	void insertNotice(Notice notice);

	void deleteNotice(Notice notice);

	void updateNotice(Notice notice);
	
	int getTotalRows(Map<String, Object> param);
	

}
