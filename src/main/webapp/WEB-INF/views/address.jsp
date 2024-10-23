<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<label for="sido">시도 : </label><select id="sido"></select>/
<label for="gugun">구군 : </label><select id="gugun"></select>
<script>
	/* function sidoInit(){
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/sido');
		xhr.onreadystatechange = function(){
			if(xhr.readyState === xhr.DONE){
				if(xhr.status === 200){
					const sido = JSON.parse(xhr.responseText);
					let html = '';
					for(const idx in sido){
						html += '<option value="' + idx + '">' + sido[idx] + '</option>';
					}
					document.querySelector('#sido').innerHTML = html;
				}
			}
		}
		xhr.send();
	}
	function gugunInit(){
		const sido = document.querySelector('#sido').value;
		const xhr = new XMLHttpRequest();
		xhr.open('GET','/sido/' + sido);
		xhr.onreadystatechange = function(){
			if(xhr.readyState === xhr.DONE){
				if(xhr.status === 200){
					const gugun = JSON.parse(xhr.responseText);
					let html = '';
					for(const idx in gugun){
						html += '<option value="' + idx + '">' + gugun[idx] + '</option>';
					}
					document.querySelector('#gugun').innerHTML = html;
					
				}
			}
		}
		xhr.send();
	}
	
	sidoInit();
	gugunInit(); */
	
	function sidoInit(){
		return axios.get('/sido');
	}
	function gugunInit(){
		const sido = document.querySelector('#sido').value;
		return axios.get('/sido/' + sido);
	}
	window.addEventListener('load',function(){
		sidoInit()
		.then((res)=>{
			const sido = res.data;
			let html = '';
			for(const idx in sido){
				html += '<option value="' + idx + '">' + sido[idx] + '</option>';
			}
			document.querySelector('#sido').innerHTML = html;
		})
		.then(gugunInit)
		.then((res)=>{
			const gugun = res.data;
			let html = '';
			for(const idx in gugun){
				html += '<option value="' + idx + '">' + gugun[idx] + '</option>';
			}
			document.querySelector('#gugun').innerHTML = html;
		})
	});

	window.addEventListener('load',async function(){
		const sidoRes = await sidoInit();
		const sido = sidoRes.data;
		let html = '';
		for(const idx in sido){
			html += '<option value="' + idx + '">' + sido[idx] + '</option>';
		}
		const gugunRes = await gugunInit();
		const gugun = gugunRes.data;
		html = '';
		for(const idx in gugun){
			html += '<option value="' + idx + '">' + gugun[idx] + '</option>';
		}
		document.querySelector('#gugun').innerHTML = html;
	});
	
</script>
</body>
</html>