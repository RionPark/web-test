package com.rest.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rest.test.vo.MovieVO;
import com.rest.test.vo.TestVO;

public interface MovieMapper {

	List<MovieVO> selectMovies(MovieVO movie);
	MovieVO selectMovie(int miNum);
	int insertMovie(MovieVO movie);
	int updateMovie(MovieVO movie);
	int deleteMovie(int miNum);
	int deleteMovies(@Param("miNums")List<Integer> miNums);
	int updateMovies(@Param("movies")List<MovieVO> movies);
}
