package com.rest.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rest.test.service.MovieService;
import com.rest.test.vo.MovieVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MovieController {
	@Autowired
	private MovieService ms;

	@GetMapping("/movies")
	public String getMovies(MovieVO movie, Model m) {
		log.info("movie=>{}", movie);
		List<MovieVO> movies = ms.selectMovies(movie);
		m.addAttribute("movies",movies);
		return "views/movie/movie-list";
	}
	@GetMapping("/movie/{miNum}")
	public String getMovie(@PathVariable int miNum, Model m) {
		MovieVO movie = ms.selectMovie(miNum);
		m.addAttribute("movie",movie);
		return "views/movie/movie-update";
	}

	@GetMapping("/movie2/{miNum}")
	@ResponseBody
	public MovieVO getMovie2(@PathVariable int miNum, Model m) {
		return ms.selectMovie(miNum);
	}
	
	@GetMapping("/movies2")
	@ResponseBody
	public List<MovieVO> getMovies2(@ModelAttribute MovieVO movie){
		log.info("movie=>{}", movie);
		List<MovieVO> movies = ms.selectMovies(movie);
		return movies;
	}
	@PostMapping("/movie-update")
	public String modifyMovie(@ModelAttribute MovieVO movie, Model m) {
		m.addAttribute("msg","실패");
		m.addAttribute("url","/movie/" + movie.getMiNum());
		if(ms.updateMovie(movie)==1) {
			m.addAttribute("msg","성공");
			m.addAttribute("url","/movies");
		}
		return "views/msg";
	}
	@PostMapping("/movies")
	public String addMovie(@ModelAttribute MovieVO movie, Model m) {
		m.addAttribute("msg","실패");
		m.addAttribute("url","/views/movie/movie-insert");
		if(ms.insertMovie(movie)==1) {
			m.addAttribute("msg","성공");
			m.addAttribute("url","/movies");
		}
		
		return "views/msg";
	}
	@PostMapping("/movies2")
	@ResponseBody
	public int addMovie2(@RequestBody MovieVO movie, Model m) {
		return ms.insertMovie(movie);
	}
}
