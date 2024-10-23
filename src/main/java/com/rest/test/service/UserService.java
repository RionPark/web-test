package com.rest.test.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public int saveUser(List<UserVO> users) {
		int result = 0;
		for(UserVO user:users) {
			if(user.getUiNum()==0) {
				result += um.insertUser(user); //0
			}else {
				result += um.updateUser(user); //0
			}
		}
		if(users.size() != result) {
			throw new RuntimeException("오류가 발생하였습니다.");
		}
		return result;
	}
	
	public int insertUser(UserVO user) {
		int result = um.insertUser(user); // 임시저장
		PointVO point  = new PointVO();
		point.setPiPoint(1000);
		point.setPiType("JOIN13213213132132132131");
		point.setUiNum(user.getUiNum());
		result += ps.insertPoint(point); // 오류가 날경우에는 전체 롤백
		return result;
	}
	
	public List<UserVO> selectUsers(UserVO user){
		return um.selectUsers(user);
	}
	
	public int deleteUsers(List<Integer> uiNums) {
		int result = 0;
		for(int uiNum:uiNums) {
			result += um.deleteUser(uiNum);
		}
		return result;
	}
}
