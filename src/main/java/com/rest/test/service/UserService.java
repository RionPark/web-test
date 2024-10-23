package com.rest.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rest.test.mapper.UserMapper;
import com.rest.test.vo.PointVO;
import com.rest.test.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
		int tmpResult = um.selectRowCount();
		log.info("result=>{}", result);
		log.info("tmpResult=>{}", tmpResult);
		if(users.size() != result) {
			throw new RuntimeException("오류가 발생하였습니다.");
		}
		return result;
	}
	
	public int insertUser(UserVO user) {
		int result = um.insertUser(user); 
		PointVO point  = new PointVO();
		point.setPiPoint(1000);
		point.setPiType("1");
		point.setUiNum(user.getUiNum());
		result += ps.insertPoint(point); 
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
