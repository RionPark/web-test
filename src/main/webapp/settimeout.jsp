<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="rDiv"></div>
<script>
//setTimeout :  
//setInterval:
	
function log(time){
	return new Promise((resolve, reject)=>{
		setTimeout(function(){
			document.querySelector('#rDiv').innerHTML += time + '<br>';
			resolve();
		},time*1000);
		
	})
}

log(3)
.then(()=>{
	return log(2);
})
.then(()=>{
	return log(1);
})
async function excuteAll(){
	await log(3);
	await log(2);
	await log(1);
}
excuteAll();
</script>
</body>
</html>