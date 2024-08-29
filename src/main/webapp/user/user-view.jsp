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

<%
String uiNum = request.getParameter("uiNum");
Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
String sql = "SELECT * FROM user_info WHERE UI_NUM=" + uiNum;
ResultSet rs = stmt.executeQuery(sql);
if(rs.next()){
%>		
<form action="/user/user-update-ok.jsp" method="GET" id="frm">
번호 : <%=rs.getString("UI_NUM")%><br>
아이디 : <input type="text" name="uiId" value="<%=rs.getString("UI_ID")%>"><br>
비밀번호 : <input type="text" name="uiPwd" value="<%=rs.getString("UI_PWD")%>"><br>
이름 : <input type="text" name="uiName" value="<%=rs.getString("UI_NAME")%>"><br>
<input type="hidden" name="uiNum" value="<%=rs.getString("UI_NUM")%>">
<button>수정</button>
<button type="button" onclick="changeAction(1)">삭제</button>
</form>
<script>
function changeAction(){
	debugger;
	const frm = document.querySelector('#frm');
	frm.action = '/user/user-delete-ok.jsp';
	frm.submit();
}
</script>
<%
}else{
%>
조회하신 유저가 이미 탈퇴되었습니다.<br>
<a href="/user/user-list.jsp">돌아가기</a>
<%
}
%>


</body>
</html>