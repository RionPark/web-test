package com.rest.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rest.test.mapper.MovieMapper;
import com.rest.test.vo.MovieVO;
import com.rest.test.vo.TestVO;

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
	public int updateMovies(List<MovieVO> movies){
		return mm.updateMovies(movies);
	}
	public int deleteMovie(int miNum){
		return mm.deleteMovie(miNum);
	}

	public int deleteMovies(List<Integer> miNums) {
		return mm.deleteMovies(miNums);
	}
}
