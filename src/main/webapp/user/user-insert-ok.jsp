<%@page import="java.sql.*"%>
<%@page import="test.web.common.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiName = request.getParameter("uiName");

Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql = "INSERT INTO USER_INFO(UI_ID, UI_PWD, UI_NAME, CREDAT, CRETIM)";
sql += "VALUES('" + uiId + "','" + uiPwd + "','" + uiName+ "',DATE_FORMAT(NOW(),'%Y%m%d'),";
sql += "DATE_FORMAT(NOW(),'%H%i%s'))";
int result = stmt.executeUpdate(sql);

if(result==1){
%>
<script>
	alert('회원가입이 완료 되었습니다.');
	location.href='/user/user-list.jsp';
</script>
<%
}else{
%>
<script>
	alert('회원가입이 실패하였습니다.');
	location.href='/user/user-insert.jsp';
</script>
<%
}
%>