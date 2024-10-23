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
function test(){
	alert('안녕');
}

var test = function(){
	alert('안녕');
}

test = ()=>{
	alert('안녕');
}

function func(t){
	t();
}

func(()=>{
	alert('안녕');
});
</script>
</body>
</html>