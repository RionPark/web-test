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
	const rDiv = document.querySelector('#rDiv');
	const arr = new Array();
	function test(num){
		const promise = new Promise((resolve,reject)=>{
			const xhr = new XMLHttpRequest();
			xhr.open('GET','/test/' + num);
			xhr.onreadystatechange = function(){
				if(xhr.readyState === xhr.DONE){
					if(xhr.status === 200){
						document.querySelector('#rDiv').innerHTML += xhr.responseText + '<br>';
						resolve();
					}
				}
			}
			xhr.send();
		});
		return promise;
	}
	
	/* test(3)
	.then(()=>{
		return test(2);
	})
	.then(()=>{
		return test(1);
	}); */
	/* async function executePromise(){
		await test(3);
		await test(2);
		await test(1);
	}
	executePromise(); */
</script>
</body>
</html>