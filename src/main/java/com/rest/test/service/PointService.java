package com.rest.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.test.mapper.PointMapper;
import com.rest.test.vo.PointVO;

@Service
public class PointService {
	@Autowired
	private PointMapper pm;
	public int insertPoint(PointVO point) {
		return pm.insertPoint(point);
	}
}
