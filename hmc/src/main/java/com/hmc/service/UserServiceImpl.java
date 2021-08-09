package com.hmc.service;



import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hmc.dao.UserDao;
import com.hmc.exception.FindException;
import com.hmc.exception.LoginException;
import com.hmc.exception.UserRegisterException;
import com.hmc.vo.User;
import com.hmc.web.util.SessionUtils;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	

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
	public void updateUser(User user) {
		userDao.updateUser(user);
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

	

}
