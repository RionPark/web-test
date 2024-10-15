package com.rest.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.test.service.PointService;
import com.rest.test.service.UserService;
import com.rest.test.vo.PointVO;
import com.rest.test.vo.UserVO;

@Controller
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
		us.insertUser(user);
		PointVO point  = new PointVO();
		point.setPiPoint(1000);
		point.setPiType("JOIN13213213132132132131");
		point.setUiNum(user.getUiNum());
		ps.insertPoint(point);
		return 0;
	}
}
