<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="miName" placeholder="영화명"><br>
<input type="text" id="miDesc" placeholder="설명"><br>
<input type="text" id="miStart" placeholder="개봉일"><br>
<button onclick="addMovie()">영화등록</button>
<div id="rDiv"></div>
<script>
function addMovie(){
	const param = {
			miName : document.querySelector('#miName').value,
			miDesc : document.querySelector('#miDesc').value,
			miStart : document.querySelector('#miStart').value
	}
	/*const formData = new FormData();
	formData.append('miName',document.querySelector('#miName').value);
	formData.append('miDesc',document.querySelector('#miDesc').value);
	formData.append('miStart',document.querySelector('#miStart').value);
	*/
	const xhr = new XMLHttpRequest();
	xhr.open('POST','/movies2');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				if(xhr.responseText === '1'){
					alert('등록 완료');
					location.href='/views/movie/movie-list2';
				}
			}
		}
	}
	xhr.setRequestHeader('Content-Type','application/json');
	//xhr.send(formData);
	xhr.send(JSON.stringify(param));
}
</script>
</body>
</html>