<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String miNum = request.getParameter("miNum"); //김밥
	
	Connection con = DBCon.getCon();
	
	String sql = "DELETE FROM MENU_INFO WHERE MI_NUM=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(41,miNum);
	
	int result = ps.executeUpdate();
	
	if(result==1){
%>
	<script>
		alert('삭제성공!');
		location.href='/menu/menu-list.jsp';
	</script>
<%
	}
%>