package com.hmc.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.MovieDao;
import com.hmc.dao.RoomDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScheduleDtoDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.dao.UserDao;
import com.hmc.dto.BranchScheduleDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.User;

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
	@Autowired
	private ScheduleDtoDao sDtoDao;
	
	@Override
	public List<Branch> getUserFavoriteBranchs(User user) {
		List<Branch> branchs = new ArrayList<Branch>();
		String branchCode1 = user.getFavoriteBranch1();
		String branchCode2 = user.getFavoriteBranch2();
		String branchCode3 = user.getFavoriteBranch3();
		String[] branchCodes = {branchCode1,branchCode2,branchCode3};
		for(String code : branchCodes) {
			if(code != null) {
				branchs.add(branchDao.getBranchDetail(code));
			}
		}
		return branchs;
	}
	
	@Override
	public List<Branch> getAllBranchs() {
		return branchDao.getAllBranchs();
	}
	
	@Override
	public User getUserById(String userId) {
		return userDao.getUserById(userId);
	}
	
	@Override
	public List<ScheduleDetail> getBranchSchedulesByDate(Map<String, Object> condition) {
		return scheduleDao.getBranchSchedulesByDate(condition);
	}
	
	@Override
	public BranchScheduleDto getBranchScheduleByOrderMovie(Map<String, Object> condition) {
		return sDtoDao.getBranchSchedulesByMovie(condition);
	}
	
	@Override
	public List<ScheduleDetail> getSchedulesByMovieAndDate(Map<String, Object> condition) {
		return scheduleDao.getSchedulesByMovieAndDate(condition);
	}

}
