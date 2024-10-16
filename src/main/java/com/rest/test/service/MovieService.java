package com.rest.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.test.mapper.MovieMapper;
import com.rest.test.vo.MovieVO;

@Service
public class MovieService {

	@Autowired
	private MovieMapper mm;
	

	public List<MovieVO> selectMovies(MovieVO movie){
		return mm.selectMovies(movie);
	}
	public MovieVO selectMovie(int miNum){
		return mm.selectMovie(miNum);
	}
	public int insertMovie(MovieVO movie){
		return mm.insertMovie(movie);
	}
	public int updateMovie(MovieVO movie){
		return mm.updateMovie(movie);
	}
	public int deleteMovie(int miNum){
		return mm.deleteMovie(miNum);
	}
}
