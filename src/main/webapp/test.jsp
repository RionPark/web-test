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
const users = [];
for(let i=1;i<=10;i++){
	const user = {
			num : i,
			name : '이름' + i,
			age : Math.floor(Math.random() *100),
			address : '주소' + i
	}
	users.push(user);
}

const users2 = [];
users.forEach((user,idx) => {
	if(user.age>=30){
		users2.push(user);
	}
});

const users3 = users.filter((user)=>{
	return user.age >= 30;
});

console.log(users3);
</script>
</body>
</html>