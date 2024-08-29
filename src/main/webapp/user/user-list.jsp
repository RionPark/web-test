<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>가입일</th>
	</tr>
<%
Connection con = DBCon.getCon();
String sql = " SELECT * FROM USER_INFO";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	out.println("<tr>");
	out.println("<td>" + rs.getString("UI_NUM") + "</td>");
	out.println("<td><a href='/user/user-view.jsp?uiNum=" + rs.getString("UI_NUM")+ "'>" + rs.getString("UI_NAME") + "</a></td>");
	out.println("<td>" + rs.getString("UI_ID") + "</td>");
	out.println("<td>" + rs.getString("CREDAT") + "</td>");
	out.println("</tr>");
}
rs.close();
stmt.close();
con.close();
%>
</table>
<a href="/user/user-insert.jsp">회원등록</a>
</body>
</html>


