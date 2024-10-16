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

<input type="text" id="miName" placeholder="영화명">
<button onclick="search()">검색</button>
<table border="1">
	<tr>
		<th>번호</th>
		<th>영화명</th>
		<th>개봉일</th>
	</tr>
	<tbody id="list"></tbody>
</table>
<script>
	function search(){
		const param = '?miName=' + document.querySelector('#miName').value;
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/movies2' + param);
		xhr.onreadystatechange = function(){
			if(xhr.readyState === xhr.DONE){
				if(xhr.status === 200){
					const moives = JSON.parse(xhr.responseText);
					let html = '';
					for(const movie of moives){
						html += '<tr>';
						html += '<td>' + movie.miNum + '</td>';
						html += '<td><a href="/views/movie/movie-update2?miNum=' + movie.miNum + '">' + movie.miName + '</a></td>';
						html += '<td>' + movie.miStart + '</td>';
						html += '</tr>';
					}
					document.querySelector('#list').innerHTML = html;
				}
			}
		}
		xhr.send();
	}
	window.onload = function(){
		search();
	}
</script>
</body>
</html>