package com.rest.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.rest.test.service.MovieService;
import com.rest.test.vo.MovieVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class TestController {
	@Autowired
	private MovieService ms;
	@GetMapping("/test")
	public List<MovieVO> getMovies(MovieVO movie){
		log.info("param=>{}", movie);
		return ms.selectMovies(movie);
	}
	@PostMapping("/test")
	public int addMoive(@RequestBody MovieVO movie) {
		log.info("param=>{}", movie);
		return 1;
	}
	@PutMapping("/test")
	public int modifyMovie(@RequestBody MovieVO movie) {
		log.info("param=>{}", movie);
		return 1;
	}
	@DeleteMapping("/test/{miNum}")
	public int deleteMovie(@PathVariable int miNum) {
		log.info("miNum=>{}", miNum);
		return 1;
	}
}
