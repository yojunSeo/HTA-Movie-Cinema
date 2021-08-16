package com.hmc.service;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.BranchDao;
import com.hmc.dao.PaymentDao;
import com.hmc.dao.UserDao;
import com.hmc.exception.FindException;
import com.hmc.exception.LoginException;
import com.hmc.exception.UserRegisterException;
import com.hmc.vo.Branch;
import com.hmc.vo.Payment;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private PaymentDao paymentDao;
	@Autowired
	private BranchDao branchDao;
	
	@Override
	public Map<String, Object> getUserExpectedGrade() {
		Map<String, Object> result = new HashMap<String, Object>();
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		int nowPaymentPrice = paymentDao.getUserTotalPayment(user.getId());
		int remainPrice = 0;
		String userGrade = user.getGrade();
		String nextGrade = null;
		if(nowPaymentPrice < 200000) {
			nextGrade = "BRONZE";
			remainPrice = 200000 - nowPaymentPrice;
		}else if(nowPaymentPrice <400000) {
			nextGrade = "SILVER";
			remainPrice = 400000 - nowPaymentPrice;
		}else if(nowPaymentPrice < 700000) {
			nextGrade = "GOLD";
			remainPrice = 700000 - nowPaymentPrice;
		}else if(nowPaymentPrice < 1000000) {
			nextGrade = "PLATINUM";
			remainPrice = 1000000 - nowPaymentPrice;
		}else {
			nextGrade = "PLATINUM";
			remainPrice = 0;
		}
		
		result.put("nextGrade", nextGrade);
		result.put("remainPrice", remainPrice);
		return result;
	}
	

	@Override
	public void register(User user) {
		User savedUser = userDao.getUserById(user.getId());
		if(savedUser != null) {
			throw new UserRegisterException("아이디 중복", "["+user.getId()+"] 는 이미 사용중인 아이디입니다.");
		}
		savedUser = userDao.getUserByEmail(user.getEmail());
		if(savedUser != null) {
			throw new UserRegisterException("이메일 중복", "["+user.getEmail()+"] 는 이미 사용중인 이메일입니다.");
		}
		savedUser = userDao.getUserByPhone(user.getPhone());
		if(savedUser != null) {
			throw new UserRegisterException("휴대폰번호 중복", "["+user.getPhone()+"] 는 이미 사용중인 휴대폰 번호입니다.");
		}
		
		String secretPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(secretPassword);
		
		userDao.insertUser(user);
		
	}

	@Override
	public void login(String id, String password) {
		
		User user = userDao.getUserById(id);
		
		if(user == null) {
			throw new LoginException("아이디/비밀번호 오류", "아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		if("N".equals(user.getStatus())) {
			throw new LoginException("사용중지된 회원", "탈퇴 혹은 일시정지 처리된 사용자입니다.");
		}
		String secretPassword = DigestUtils.sha256Hex(password);
		if(!secretPassword.equals(user.getPassword())) {
			throw new LoginException("아이디/비밀번호 오류", "아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		SessionUtils.addAttribute("LOGINED_USER", user);
		
	}
	
	@Override
	public List<Branch> getUserFavoriteBranch() {
		List<Branch> branchs = new ArrayList<Branch>();
		User user = (User)SessionUtils.getAttribute("LOGINED_USER");
		Branch branch1 = branchDao.getBranchDetail(user.getFavoriteBranch1());
		Branch branch2 = branchDao.getBranchDetail(user.getFavoriteBranch2());
		Branch branch3 = branchDao.getBranchDetail(user.getFavoriteBranch3());
		branchs.add(branch1);
		branchs.add(branch2);
		branchs.add(branch3);
		return branchs;
	}

	@Override
	public void updateUser(User user) {
		System.out.println(user);
		userDao.updateUser(user);
		System.out.println(user);
	}

	@Override
	public void deleteUser(User user) {
		userDao.deletedUser(user);
	}

	@Override
	public String findId(String name, String email) {
		User userByName = userDao.getUserByName(name);
		if(userByName == null) {
			throw new FindException("정보조회 오류", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		}
		
		User userByEmail = userDao.getUserByEmail(email);
		if(userByEmail == null) {
			throw new FindException("정보조회 오류", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		}
		
		if(!userByName.getId().equals(userByEmail.getId())) {
			throw new FindException("정보조회 오류", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		}
		
		return userByEmail.getId();
	}

	@Override
	public String findPwd(String id, String email) {
		User userById = userDao.getUserById(id);
		if(userById == null) {
			throw new FindException("정보조회 오류", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		}
		
		User userByEmail = userDao.getUserByEmail(email);
		if(userByEmail == null) {
			throw new FindException("정보조회 오류", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		}
		
		if(!userById.getId().equals(userByEmail.getId())) {
			throw new FindException("정보조회 오류", "입력하신 정보와 일치하는 회원정보가 존재하지 않습니다.");
		}
		
		Random rand = new Random(System.currentTimeMillis());
		String TemporaryPwd = ("hmc" + String.valueOf(Math.abs(rand.nextInt(990000)+10000)));
		String secretPassword = DigestUtils.sha256Hex(TemporaryPwd);
		
		userById.setPassword(secretPassword);
		userDao.updateUser(userById);
		
		return TemporaryPwd;
	}

	@Override
	public List<User> AdminGetAllUsers(Map<String, Object> param) {
		List<User> users = userDao.AdminGetAllUsers(param);
		return users;
	}

	@Override
	public int getTotalRows(Map<String, Object> param) {
		int totalRows = userDao.getTotalRows(param);
		return totalRows;
	}

	@Override
	public User getUserById(String userId) {
		User user = userDao.getUserById(userId);
		return user;
	}
	
	@Override
	public User getUserByPhone(String phone) {
		return userDao.getUserByPhone(phone);
	}

	@Override
	public void rollbackUser(User user) {
		userDao.rollbackUser(user);
		
	}

	@Override
	public void setAdmin(User user) {
		userDao.setAdmin(user);
	}

	@Override
	public void removeAdmin(User user) {
		userDao.removeAdmin(user);
	}
	
	@Override
	public List<Branch> getAllBranchs() {
		return branchDao.getAllActiveBranchs();
	}


	@Override
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	

}
