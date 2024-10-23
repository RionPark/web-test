package com.rest.test.mapper;

import java.util.List;

import com.rest.test.vo.UserVO;

public interface UserMapper {
	int insertUser(UserVO user);
	int updateUser(UserVO user);
	int deleteUser(int uiNum);
	int selectRowCount();
	UserVO selectUserForLogin(UserVO user);
	List<UserVO> selectUsers(UserVO user);
}
