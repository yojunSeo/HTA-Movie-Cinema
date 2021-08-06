package com.hmc.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.ScheduleDao;
import com.hmc.dao.ScheduleDtoDao;
import com.hmc.dao.ScreenMovieDao;
import com.hmc.dao.SeatDao;
import com.hmc.dao.UserDao;
import com.hmc.dto.BranchDto;
import com.hmc.dto.BranchScheduleDto;
import com.hmc.dto.MovieDto;
import com.hmc.dto.MovieScheduleDto;
import com.hmc.dto.ScheduleDetail;
import com.hmc.vo.Branch;
import com.hmc.vo.ScreenMovie;
import com.hmc.vo.SeatBooking;
import com.hmc.vo.User;
import com.hmc.web.util.DateUtils;
import com.hmc.web.util.SessionUtils;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
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
	
	@Override
	public BranchScheduleDto getSchedules(String branchCode, String screenCode, String screenDate) {
		// 영화관코드와 날짜는 무조건 존재 근데 screencode는 없을수도 있다
		BranchScheduleDto branchSchedules = new BranchScheduleDto();
		Map<String, Object> param = new HashMap<String, Object>();
		if(!screenCode.equals("")) {
			// 전부 다 존재할 때
			param.put("branchCode", branchCode);
			param.put("screenDate", screenDate);
			param.put("screenCode", screenCode);
			branchSchedules = sDtoDao.getBranchSchedulesByMovieAndDate(param);
		}else {
			// 영화관코드와 날짜만 존재할때
			param.put("branchCode", branchCode);
			param.put("screenDate", screenDate);
			branchSchedules = sDtoDao.getBranchSchedulesByMovie(param);
		}
		return branchSchedules;
	}
	
	@Override
	public Map<String, Object> allAboutSchedule() {
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		// 만약 로그인 안되어 있거나 선호영화관이 없을떄
		List<Branch> branchs = new ArrayList<Branch>();
		String defaultArea = "서울";
		if(user == null || getUserFavoriteBranchs(user).size() == 0) {
			branchs = branchDao.getAllActiveBranchs();
		}else {
			branchs = getUserFavoriteBranchs(user);
			defaultArea = "MY 영화관";
		}
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("defalutArea", defaultArea);
		result.put("branchs", branchs);
		result.put("movies", screenDao.getAllScreenMovies());
		return result;
	}
	
	@Override
	public List<Branch> getUserFavoriteBranchs(User user) {
		List<Branch> branchs = new ArrayList<Branch>();
		if(user != null) {
			String branchCode1 = user.getFavoriteBranch1();
			String branchCode2 = user.getFavoriteBranch2();
			String branchCode3 = user.getFavoriteBranch3();
			String[] branchCodes = {branchCode1,branchCode2,branchCode3};
			for(String code : branchCodes) {
				if(code != null) {
					branchs.add(branchDao.getBranchDetail(code));
				}
			}
		}
		return branchs;
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
	public ScheduleDetail getScheduleDetail(String scheduleCode) {
		return scheduleDao.getScheduleDetailByCode(scheduleCode);
	}
	
	@Override
	public List<Map<String, Object>> getBookingSeat(String scheduleCode) {
		List<SeatBooking> bookedSeats = seatDao.getSeatBookingsBySchedule(scheduleCode);
		List<Map<String, Object>> nonableSeats = new ArrayList<Map<String, Object>>();
		for(SeatBooking bs : bookedSeats) {
			Map<String, Object> seat = seatDao.getSeatByCode(bs.getSeatCode());
			nonableSeats.add(seat);
		}
		return nonableSeats;
	}
	
	@Override
	public List<Map<String, Object>> getBranchMovies(String branchCode) {
		List<Map<String, Object>> screenMovies = screenDao.getBranchMovies(branchCode);
		return screenMovies;
	}
	
	@Override
	public Map<String, Object> getSeatByCode(String seatCode) {
		return seatDao.getSeatByCode(seatCode);
	}
	
	@Override
	public Map<String, Object> getBookedAndRoomSeats(String scheduleCode) {
		// TODO Auto-generated method stub
		ScheduleDetail schedule = scheduleDao.getScheduleDetailByCode(scheduleCode);
		// 예매불가능한 좌석들을 받아온다
		List<Map<String, Object>> bookedSeats = getBookingSeat(scheduleCode);
		// 스케줄에 해당하는 상영관의 좌석정보를 받아온다.
		List<Map<String, Object>> roomSeats = seatDao.getRoomSeats(schedule.getRoomCode());
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("bookedSeats", bookedSeats);
		result.put("roomSeats", roomSeats);
		return result;
	}
	
	@Override
	public Map<String, Object> branchSheduleinfo() {
		Map<String, Object> param = new HashMap<String, Object>();
		// 모든 상영관 조회해서 담기
		List<Branch> branchs = branchDao.getAllBranchs(); 
		param.put("allBranchs", branchs);
		
		// 디폴트 값들 정하기
		String defaultBranch = branchs.get(0).getCode();
		String defaultArea = "서울";
		
		// 로그인 여부 확인
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		if(user == null) {
			// 로그인 안된경우 : favoritebranchs에 false
			param.put("favoriteBranchs", false);
		}else {
			// 로그인 된 경우 - 선호 영화관 있는경우 없는경우 나눈다.
			List<Branch> favoritebranchs = getUserFavoriteBranchs(user);
			if(favoritebranchs.size() == 0) {
				// 선호 영화관 없는 경우
				param.put("favoriteBranchs", false);
			}else {
				// 선호 영화관 있는 경우
				param.put("favoriteBranchs", favoritebranchs);
				defaultArea = "MY 영화관";
				defaultBranch = favoritebranchs.get(0).getCode();
			}
		}
		param.put("defaultArea", defaultArea);
		param.put("defaultBranch", defaultBranch);
		// 디폴트 영화관의 오늘 상영스케줄 담기 // 영화별로 정렬
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", defaultBranch);
		condition.put("screenDate", DateUtils.dateToDateString(new Date()));
		BranchScheduleDto branchSchedules = sDtoDao.getBranchSchedulesByMovie(condition);
		param.put("schedules", branchSchedules);
		return param;
	}
	
	@Override
	public List<Branch> getAreaBranch(String area) {
		List<Branch> branchs = new ArrayList<Branch>();
		if("서울".equals(area)) {
			branchs = branchDao.getAllBranchs();
		}else {
			// my영화관 선택한경우
			User user = (User)SessionUtils.getAttribute("LOGINED_USER");
			List<Branch> myBranchs = getUserFavoriteBranchs(user);
			if(user != null || myBranchs.size()!=0) {
				branchs = myBranchs;
			}
		}
		return branchs;
	}
	
	@Override
	public List<MovieDto> getMovieSchedule(String branchCode, String screenDate) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("branchCode", branchCode);
		condition.put("screenDate", screenDate);
		BranchScheduleDto bsd = sDtoDao.getBranchSchedulesByMovie(condition);
		List<MovieDto> movies = new ArrayList<MovieDto>();
		if(bsd != null) {
			movies = bsd.getMovies();
		}
		return movies;
	}
	
	@Override
	public Map<String, Object> getMovieSheduleinfo() {
		Map<String, Object> info = new HashMap<String, Object>();
		List<Map<String, Object>> movies = screenDao.getScreenSimpleInfo();
		info.put("movies", movies);
		Map<String, Object> defaultMovie = movies.get(0);
		info.put("defaultMovie", defaultMovie);		
		return info;
	}
	
	@Override
	public List<BranchDto> getBranchSchedule(String screenCode, String screenDate) {
		Map<String, Object> condition = new HashMap<String, Object>();
		condition.put("screenCode", screenCode);
		condition.put("screenDate", screenDate);
		MovieScheduleDto msd = sDtoDao.getMoiveSchedulesByBranch(condition);
		List<BranchDto> branchs = new ArrayList<BranchDto>();
		if(msd != null) {
			branchs =msd.getBranchs();
		}
		return branchs;
	}
}
