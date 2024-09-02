<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  user-insert.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/user2/user-insert-ok.jsp">
	<label for="uiName">이름 : </label>
	<input type="text" name="uiName" id="uiName"><br>
	<label for="uiId">아이디 : </label>
	<input type="text" name="uiId" id="uiId"><br>
	<label for="uiPwd">비밀번호 : </label>
	<input type="password" name="uiPwd" id="uiPwd"><br>
	성별 :
	<label for="male">남</label>
	<input type="radio" name="uiGender" id="male" value="1">
	<label for="fmale">여</label>
	<input type="radio" name="uiGender" id="fmale" value="2"><br>
	<label for="uiBirth">생일 : </label>
	<input type="date" name="uiBirth" id="uiBirth"><br>
	취미 : 
	<label for="h1">자전거</label>
	<input type="checkbox" name="uiHobby" value="자전거" id="h1">
	<label for="h2">영화</label>
	<input type="checkbox" name="uiHobby" value="영화" id="h2">
	<label for="h3">드라이브</label>
	<input type="checkbox" name="uiHobby" value="드라이브" id="h3"><br>
	<label for="uiDesc">자기소개 : </label>
	<textarea name="uiDesc" id="uiDesc"></textarea><br>
	<button>회원가입</button>
</form>
</body>
</html>