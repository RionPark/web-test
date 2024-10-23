package com.rest.test.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rest.test.vo.AdminVO;

@RestController
public class AdminController {

	@GetMapping("/admin/api/items")
	public List<AdminVO> getItems(){
		List<AdminVO> items = new ArrayList<>();
		for(int i=1;i<=10;i++) {
			AdminVO item = new AdminVO();
			item.setId(Integer.toUnsignedLong(i));
			item.setName("test" + i);
			item.setDescription("설명" + i);
			items.add(item);
		}
		return items;
	}
}
