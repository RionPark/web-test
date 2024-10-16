<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="miName" value="${movie.miName}"><br>
<input type="text" id="miDesc" value="${movie.miDesc}"><br>
<input type="text" id="miStart" value="${movie.miStart}"><br>
<button onclick="modifyMovie()">수정</button>

<script>
window.onload = function(){

	const xhr = new XMLHttpRequest();
	xhr.open('GET','/movie2/${param.miNum}');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				const movie = JSON.parse(xhr.responseText);
				console.log(movie);
			}
		}
	}
	xhr.send();
}
function modifyMovie(){
	const param = {
			miName : document.querySelector('#miName').value,
			miDesc : document.querySelector('#miDesc').value,
			miStart : document.querySelector('#miStart').value
	}
	const xhr = new XMLHttpRequest();
	xhr.open('PUT','/movies');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				
			}
		}
	}
	xhr.send();
}
</script>
</body>
</html>