<%@page import="com.rest.test.vo.MovieVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>영화리스트</h3>
<form action="/movies" method="GET">
	<input type="text" name="miName" placeholder="영화명">
	<button>검색</button>
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>영화명</th>
		<th>개봉일</th>
	</tr>
	<c:forEach items="${movies}" var="movie">
		<tr>
			<td>${movie.miNum}</td>
			<td><a href="/movie/${movie.miNum}">${movie.miName}</a></td>
			<td>${movie.miStart}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>