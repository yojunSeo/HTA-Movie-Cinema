package com.hmc.service;


import com.hmc.vo.User;

public interface UserService {
	
	/**
	 * 회원가입
	 * @param user
	 */
	void register(User user);
	
	/**
	 * 로그인
	 * @param id
	 * @param password
	 */
	void login(String id, String password);
	
	/**
	 * 회원정보 수정
	 * @param user
	 */
	void updateUser(User user);
	
	/**
	 * 회원탈퇴
	 * @param user
	 */
	void deleteUser(User user);
	
	String findId(String name, String email);
	
	String findPwd(String id, String email);
	
	

}
