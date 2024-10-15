<%@page import="com.rest.test.vo.UserVO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
안녕
<%
if(session.getAttribute("user")==null){
%>
<h3>폼태그</h3>
<form action="/user/login" method="POST">
<input type="text" name="uiId"><br>
<input type="password" name="uiPwd"><br>
<button>Login</button>
</form>
<h3>ajax</h3>
<form>
<input type="text" id="uiId"><br>
<input type="password" id="uiPwd"><br>
<button type="button" onclick="login()">Login</button>
</form>
<script>
function login(){
	const param = {
			uiId : document.querySelector('#uiId').value,
			uiPwd : document.querySelector('#uiPwd').value
	}
	const xhr = new XMLHttpRequest();
	xhr.open('POST','/user/login-ajax');
	xhr.onreadystatechange = function(){
		if(xhr.readyState === xhr.DONE){
			if(xhr.status === 200){
				if(xhr.responseText === 'true'){
					alert('로그인이 되었습니다.');
					location.href='/';
				}
			}
		}
	}
	xhr.setRequestHeader('Content-Type','application/json');
	xhr.send(JSON.stringify(param));
}
</script>
<%
}else{
%>
<%
UserVO user = (UserVO)session.getAttribute("user");
out.println(user.getUiName() + "님 안녕하세요"); 
%>
<button onclick="location.href='/logout.jsp'">로그아웃</button>
<%
}
%>
</body>
</html>