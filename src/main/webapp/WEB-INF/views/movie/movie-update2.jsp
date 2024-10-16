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
<button onclick="removeMovie()">삭제</button>

<script>
function removeMovie(){
	const xhr = new XMLHttpRequest();
	xhr.open('DELETE','/movies/${param.miNum}');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				if(xhr.responseText === '1'){
					alert('삭제 완료!');
					location.href='/views/movie/movie-list2';
				}
			}
		}
	}
	xhr.send();
}
window.onload = function(){

	const xhr = new XMLHttpRequest();
	xhr.open('GET','/movie2/${param.miNum}');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				const movie = JSON.parse(xhr.responseText);
				for(const id in movie){
					if(document.querySelector('#'+id)){
						document.querySelector('#'+id).value = movie[id];
					}
				}
			}
		}
	}
	xhr.send();
}
function modifyMovie(){
	const param = {
			miNum : ${param.miNum},
			miName : document.querySelector('#miName').value,
			miDesc : document.querySelector('#miDesc').value,
			miStart : document.querySelector('#miStart').value
	}
	const xhr = new XMLHttpRequest();
	xhr.open('PUT','/movies');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				if(xhr.responseText === '1'){
					alert('수정완료');
					location.href='/views/movie/movie-list2';
				}
			}
		}
	}
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.send(JSON.stringify(param));
}
</script>
</body>
</html>