<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String miNum = request.getParameter("miNum"); //김밥
	String miName = request.getParameter("miName"); //김밥
	String miPrice = request.getParameter("miPrice"); //2000
	String miDesc = request.getParameter("miDesc"); //맛있어
	
	Connection con = DBCon.getCon();
	
	String sql = "UPDATE MENU_INFO\n"
			+ "SET MI_NAME=?,\n"
			+ "MI_PRICE=?,\n"
			+ "MI_DESC=?\n"
			+ "WHERE MI_NUM=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,miName);
	ps.setString(2,miPrice);
	ps.setString(3,miDesc);
	ps.setString(4,miNum);
	
	int result = ps.executeUpdate();
	
	if(result==1){
%>
	<script>
		alert('수정성공!');
		location.href='/menu/menu-view.jsp=miNum=<%=miNum%>';
	</script>
<%
	}
%>