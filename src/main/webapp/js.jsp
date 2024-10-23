<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
let users = [];

users.push({
	uiId:false,uiNum:1
})
users[users.length] = {
	uiId:false,uiNum:2
}
users[users.length] = {
	uiId:true,uiNum:0
}
users[users.length] = {
	uiId:true,uiNum:3
}
users[users.length] = {
	uiId:false,uiNum:4
}
users[users.length] = {
	uiId:false,uiNum:5
}
console.log(users);

const uiNums = users
				.filter(user=>user.uiId)
				.map(user=>user.uiNum);
/* for(const cu of checkedUsers){
	uiNums.push(cu.uiNum);
} */
console.log(uiNums);
</script>
</body>
</html>