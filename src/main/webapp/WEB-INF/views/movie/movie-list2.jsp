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
<button onclick="deleteMovies()">삭제</button>
<button onclick="modifyMovies()">수정</button>
<table border="1">
	<tr>
		<th><input type="checkbox" id="allCheck" onchange="togleCheck(this)"></th>
		<th>번호</th>
		<th>영화명</th>
		<th>설명</th>
		<th>개봉일</th>
	</tr>
	<tbody id="list"></tbody>
</table>
<script>
	function modifyMovies(){
		const checkedObjs = document.querySelectorAll('input[name=miNum]');
		const miNames = document.querySelectorAll('input[name=miName]');
		const miStarts = document.querySelectorAll('input[name=miStart]');
		const miDescs = document.querySelectorAll('input[name=miDesc]');
		const param = [];
		for(const idx in checkedObjs){
			const checkedObj = checkedObjs[idx];
			if(checkedObj.checked){
				param.push({
					miNum : checkedObj.value,
					miName : miNames[idx].value,
					miDesc : miDescs[idx].value,
					miStart : miStarts[idx].value
				});
			}
		}
		console.log(param);
		const xhr = new XMLHttpRequest();
		xhr.open('PUT','/movies2');
		xhr.onreadystatechange = function(){
			if(xhr.readyState === xhr.DONE){
				if(xhr.status === 200){
					alert(xhr.responseText);
				}
			}
		}
		xhr.setRequestHeader('Content-Type','application/json');
		xhr.send(JSON.stringify(param));
	}
	function deleteMovies(){
		const checkedObjs = document.querySelectorAll('input[name=miNum]:checked');
		const param = [];
		for(const checkObj of checkedObjs){
			param.push(checkObj.value);
		}
		const xhr = new XMLHttpRequest();
		xhr.open('DELETE','/movies2');
		xhr.onreadystatechange = function(){
			if(xhr.readyState === xhr.DONE){
				if(xhr.status === 200){
					alert(xhr.responseText);
				}
			}
		}
		xhr.setRequestHeader('Content-Type','application/json');
		xhr.send(JSON.stringify({miNums:param}));
		/*
		{nums : [1,2,3]}
		*/
		
	}
	function togleCheck(allCheck){
		const checkObjs = document.querySelectorAll('input[name=miNum]');
		for(const checkObj of checkObjs){
			checkObj.checked = allCheck.checked;
		}
	}
	
	function checkOne(){
		const checkObjs = document.querySelectorAll('input[name=miNum]');
		for(const checkObj of checkObjs){
			if(!checkObj.checked){
				document.querySelector('#allCheck').checked = false;
				return;
			}
		}
		document.querySelector('#allCheck').checked = true;
	}
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
						html += '<td><input type="checkbox" name="miNum" value="' + movie.miNum + '" onchange="checkOne(this)"></td>';
						html += '<td>' + movie.miNum + '</td>';
						html += '<td><input type="text" name="miName" value="' + movie.miName + '"></td>';
						html += '<td><input type="text" name="miDesc" value="' + movie.miDesc + '"></td>';
						html += '<td><input type="text" name="miStart" value="' + movie.miStart + '"></td>';
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