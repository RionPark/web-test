package com.rest.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.test.service.PointService;
import com.rest.test.service.UserService;
import com.rest.test.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	@Autowired
	private UserService us;
	@Autowired
	private PointService ps;
	@PostMapping("/user/login")
	public String login(HttpSession session,@ModelAttribute UserVO user, Model m) {
		m.addAttribute("msg","로그인이 실패하였습니다.");
		UserVO loginUser = us.login(user);
		if(loginUser!=null) {
			session.setAttribute("user", loginUser);
			m.addAttribute("msg","로그인이 성공하였습니다.");
			m.addAttribute("url","/");
		}
		return "views/msg";
	}
	@PostMapping("/user/login-ajax")
	@ResponseBody
	public UserVO loginAjax(HttpSession session,@RequestBody UserVO user, Model m) {
		UserVO loginUser = us.login(user);
		session.setAttribute("user", loginUser);
		return loginUser;
	}
	
	@PostMapping("/user/join")
	@ResponseBody
	public int join(@RequestBody UserVO user) {
		/*
		 * Read   = SELECT
		 * 
		 * Create = INSERT
		 * Update = UPDATE
		 * Delete = DELETE
		 */
		us.insertUser(user);
		return 0;
	}
	
	@GetMapping("/users")
	@ResponseBody 
	public List<UserVO> selectUsers(UserVO user){
		return us.selectUsers(user);
	}
	
	@PostMapping("/users")
	@ResponseBody
	public int saveUsers(@RequestBody List<UserVO> users) {
		log.info("users=>{}", users);
		return us.saveUser(users);
	}
	
	@DeleteMapping("/users")
	@ResponseBody
	public int deleteUsers(@RequestBody List<Integer> uiNums) {
		return us.deleteUsers(uiNums);
	}
}
