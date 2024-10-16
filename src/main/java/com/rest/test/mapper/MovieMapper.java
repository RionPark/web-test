package com.rest.test.mapper;

import java.util.List;

import com.rest.test.vo.MovieVO;

public interface MovieMapper {

	List<MovieVO> selectMovies(MovieVO movie);
	MovieVO selectMovie(int miNum);
	int insertMovie(MovieVO movie);
	int updateMovie(MovieVO movie);
	int deleteMovie(int miNum);
}
