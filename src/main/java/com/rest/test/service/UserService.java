package com.rest.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rest.test.mapper.UserMapper;
import com.rest.test.vo.PointVO;
import com.rest.test.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserMapper um;
	@Autowired
	private PointService ps;
	
	public UserVO login(UserVO user) {
		return um.selectUserForLogin(user);
	}
	
	@Transactional
	public int insertUser(UserVO user) {
		int result = um.insertUser(user);
		PointVO point  = new PointVO();
		point.setPiPoint(1000);
		point.setPiType("JOIN13213213132132132131");
		point.setUiNum(user.getUiNum());
		result += ps.insertPoint(point);
		return result;
	}
}
