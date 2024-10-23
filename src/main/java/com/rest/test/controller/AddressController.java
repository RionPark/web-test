package com.rest.test.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AddressController {
	private Map<Integer, String> sido = new HashMap<>();
	private Map<Integer, List<String>> gugun = new HashMap<>();
	{
		sido.put(1, "서울");
		sido.put(2, "경기도");
		sido.put(3, "광주");
		sido.put(4, "부산");
		List<String> sList = new ArrayList<>();
		sList.add("강서구");
		sList.add("강남구");
		gugun.put(1, sList);
		sList = new ArrayList<>();
		sList.add("양평군");
		sList.add("연천군");
		gugun.put(2, sList);
		sList = new ArrayList<>();
		sList.add("북구");
		sList.add("동구");
		gugun.put(3, sList);
		sList = new ArrayList<>();
		sList.add("영동구");
		sList.add("부산해운대구");
		gugun.put(4, sList);
	}
	@GetMapping("/sido")
	public Map<Integer, String> getSido(){
		return sido;
	}
	@GetMapping("/sido/{idx}")
	public List<String> getGugun(@PathVariable int idx){
		return gugun.get(idx);
	}
}
