<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/user/user-insert-ok.jsp" method="GET">
	ID : <input type="text" name="uiId"><br>
	비밀번호 : <input type="password" name="uiPwd"><br>
	이름 : <input type="text" name="uiName"><br>
	<button>회원가입</button>
</form>
</body>
</html>