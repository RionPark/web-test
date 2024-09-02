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
String uiName = request.getParameter("uiName") == null ? "" : request.getParameter("uiName");
String uiGender = request.getParameter("uiGender") == null ? "" : request.getParameter("uiGender");

Connection con = DBCon.getCon();
String sql = " SELECT UI_NUM, UI_NAME, UI_ID, "
			+ " UI_GENDER, UI_BIRTH, CREDAT"
			+ " FROM user_info";
if(!uiName.equals("")){
	sql += " WHERE UI_NAME LIKE ?";
	if(!uiGender.equals("")){
		sql += " AND UI_GENDER = ?";
	}
}else if(!uiGender.equals("")){
	sql += " WHERE UI_GENDER = ?";
}
PreparedStatement stmt = con.prepareStatement(sql);
if(!uiName.equals("")){
	stmt.setString(1, "%" + uiName + "%");
	if(!uiGender.equals("")){
		stmt.setString(2, uiGender);
	}
}else if(!uiGender.equals("")){
	stmt.setString(1,uiGender);
}
ResultSet rs = stmt.executeQuery();
%>
<form>
	<select name="uiGender">
		<option value="">선택</option>
		<option value="1" <%=uiGender.equals("1")?"selected":""%>>남자</option>
		<option value="2" <%=uiGender.equals("2")?"selected":""%>>여자</option>
	</select>
	<input type="text" name="uiName" value="<%=uiName%>" placeholder="이름"><button>검색</button>
</form>

<form id="deleteForm" action="/user2/user-delete-ok.jsp" method="POST">
	<input type="hidden" name="uiNum" id="uiNum">
</form>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>아이디</th>
		<th>성별</th>
		<th>생일</th>
		<th>가입일</th>
		<th>삭제</th>
	</tr>
<%
while(rs.next()){
%>
	<tr style="cursor:pointer" 
	onclick="goPage(event, this, <%=rs.getString("UI_NUM")%>)" 
	onmouseover="this.style.backgroundColor='gray'" 
	onmouseout="this.style.backgroundColor=''"
	>
		<td><%=rs.getString("UI_NUM") %></td>
		<td><%=rs.getString("UI_NAME") %></td>
		<td><%=rs.getString("UI_ID") %></td>
		<td><%=rs.getString("UI_GENDER").equals("1") ? "남자":"여자"%></td>
		<td><%=rs.getString("UI_BIRTH") %></td>
		<td><%=rs.getString("CREDAT") %></td>
		<td><button type="button" >삭제</button></td>
	</tr>
<%
}
%>
</table>
<script>

function deleteUserInfo(uiNum){
	const deleteForm = document.querySelector('#deleteForm');
	document.querySelector('input[name=uiNum]').value = uiNum;
	deleteForm.submit(); 
}
function goPage(evt, obj, uiNum){
	if(evt.target.tagName==='BUTTON'){
		deleteUserInfo(uiNum);
		return;
	}
	location.href='/user2/user-view.jsp?uiNum=' + uiNum;
}
</script>
</body>
</html>