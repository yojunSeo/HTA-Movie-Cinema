package com.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.MovieDao;
import com.hmc.dao.RoomDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.dao.UserDao;
import com.hmc.dto.UserFavoriteTheather;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScreenMovieDao screenDao;
	@Autowired
	private BranchDao branchDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public UserFavoriteTheather getUserFavoriteBranchs(String userId) {
		return userDao.getUserFavoriteBranchs(userId);
	}

}
