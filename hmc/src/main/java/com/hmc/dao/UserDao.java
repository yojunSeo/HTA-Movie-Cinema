package com.hmc.dao;


import java.util.List;
import java.util.Map;

import com.hmc.vo.Notice;
import com.hmc.vo.User;

public interface UserDao {

	void insertUser(User user);

	User getUserById(String userId);
	
	List<User> getAllUsers();

	void updateUser(User user);
	
	/**
	 * 사용자정보를 받아서 탈퇴처리
	 * @param user 사용자 정보
	 */
	void deletedUser(User user);
	
	User getUserByEmail(String email);

	User getUserByPhone(String phone);
	
	User getUserByName(String name);
	
	List<User> AdminGetAllUsers(Map<String, Object> param);
	
	int getTotalRows(Map<String, Object> param);
	
	void rollbackUser(User user);
	
	void setAdmin(User user);
	
	void removeAdmin(User user);

}

