package com.hmc.dao;

<<<<<<< HEAD
public interface UserDao {
	
	

}
=======
import java.util.List;

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



}
>>>>>>> 25b8dcb184f82f5abd49ec1e0315fc3ad3374052
