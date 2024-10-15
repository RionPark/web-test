package com.rest.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.test.mapper.UserMapper;
import com.rest.test.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserMapper um;
	
	public UserVO login(UserVO user) {
		return um.selectUserForLogin(user);
	}
	
	public int insertUser(UserVO user) {
		return um.insertUser(user);
	}
}
