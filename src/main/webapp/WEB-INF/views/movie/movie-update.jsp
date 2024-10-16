<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/movie-update" method="POST">
	<input type="hidden" name="miNum" value="${movie.miNum}">
	<input type="text" name="miName" value="${movie.miName}"><br>
	<input type="text" name="miDesc" value="${movie.miDesc}"><br>
	<input type="text" name="miStart" value="${movie.miStart}"><br>
	<button>수정</button>
</form>
</body>
</html>