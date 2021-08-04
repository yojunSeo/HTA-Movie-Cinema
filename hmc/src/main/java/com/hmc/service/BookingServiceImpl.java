package com.hmc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.CouponDao;
import com.hmc.dao.PaymentDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScheduleDtoDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.dao.SeatDao;
import com.hmc.dao.UserDao;

@Service
public class BookingServiceImpl implements BookingService{
	
	@Autowired
	private ScreenMovieDao screenDao;
	@Autowired
	private BranchDao branchDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private ScheduleDtoDao sDtoDao;
	@Autowired
	private SeatDao seatDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private PaymentDao paymentDao;
	
	@Override
	public List<Map<String, Object>> getAbleCouponByUserId(String userId) {
		return couponDao.getAbleCouponByUserId(userId);
	}

	@Override
	public String getPublishedCouponType(String publishedId) {
		Map<String, Object> coupon = couponDao.getPublishedCouponByCode(publishedId);
	 	String type = coupon.get("TYPE").toString();
		return type;
	}
	
	@Override
	public int getUserTotalPayment(String userId) {
		return paymentDao.getUserTotalPayment(userId);
	}
}
