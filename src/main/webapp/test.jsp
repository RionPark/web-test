<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Map<String,String[]> paramMap = request.getParameterMap();
String[] genders = paramMap.get("gender");
String[] hobby = paramMap.get("hobby");
request.getParameter("gender");
request.getParameter("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
	성별 : 남<input type="radio" name="gender" value="1">
	여<input type="radio"  name="gender" value="2"><br> 
	
	취미 : 바이크<input type="checkbox" name="hobby" value="바이크">
	스노우보드<input type="checkbox" name="hobby"  value="스노우보드">
	게임<input type="checkbox"  name="hobby" value="게임">
	<button>전송</button>
</form>
</body>
</html>