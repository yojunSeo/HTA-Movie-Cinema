package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.NoticeDao;
import com.hmc.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao noticeDao;

	@Override
	public List<Notice> getAllNotices(Map<String, Object> param) {
		System.out.println("impl들어옴");
		List<Notice> notices = noticeDao.getAllNotices(param);
		System.out.println("idao호출");
		return notices;
	}

	@Override
	public Notice getNoticeByCode(String code) {
		Notice notice = noticeDao.getNoticeByCode(code);
		return notice;
	}

	@Override
	public void insertNotice(Notice notice) {
		
	}

	@Override
	public void deleteNotice(Notice notice) {
		noticeDao.deleteNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}

	@Override
	public int getTotalRows(Map<String, Object> param) {
		int rows = noticeDao.getTotalRows(param);
		return rows;
	}

}
