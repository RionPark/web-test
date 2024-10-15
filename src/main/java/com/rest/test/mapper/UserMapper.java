package com.rest.test.mapper;

import java.util.List;

import com.rest.test.vo.UserVO;

public interface UserMapper {
	int insertUser(UserVO user);
	UserVO selectUserForLogin(UserVO user);
}
