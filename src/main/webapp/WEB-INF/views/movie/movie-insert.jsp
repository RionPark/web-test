<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/movies" method="POST">
	<input type="text" name="miName" placeholder="영화명"><br>
	<input type="text" name="miDesc" placeholder="설명"><br>
	<input type="text" name="miStart" placeholder="개봉일"><br>
	<button>영화등록</button>
</form>
</body>
</html>