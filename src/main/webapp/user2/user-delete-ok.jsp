<%@page import="java.sql.PreparedStatement"%>
<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- user-delete-ok.jsp -->    
<%
//user-list.jsp에서 선택된 로우의 uiNum을 받아옴
String uiNum = request.getParameter("uiNum");
//데이터베이스 연결함
Connection con = DBCon.getCon();
//sql문을 작성함
String sql = "DELETE FROM USER_INFO WHERE UI_NUM=?";
//SQL문으로 PREPAREDSTATEMENT를 생성함
PreparedStatement ps = con.prepareStatement(sql);
//sql문의 ?에 uiNum을 바인딩 시킴
ps.setString(1, uiNum);
//ps를 실행하여 sql을 실행함
int result = ps.executeUpdate();

if(result==1){
%>
<script>
	alert('삭제되었습니다.');
	location.href='/user2/user-list.jsp';
</script>
<%
}
//ps를 종료시킴
ps.close();
//커넥션을 종료시킴
con.close();
%>