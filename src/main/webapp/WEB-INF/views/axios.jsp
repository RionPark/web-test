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
<table border="1">
	<tr>
		<th>번호</th>
		<td>영화명</td>
		<td>개봉일</td>
	</tr>
	<tbody id="tBody"></tbody>
</table>
<button onclick="addMovie()">영화입력</button>
<button onclick="modifyMovie()">영화수정</button>
<button onclick="deleteMovie()">영화수정</button>
<script>

	async function deleteMovie(){
		const res = await axios.delete('/test/1');
		if(res.data == 1){
			alert('영화입력 성공');
		}
	}
	async function addMovie(){
		const params = {
				miName : '신세계',
				miDesc : '헬로',
				miStart : '2022-10-11'
		}
		const res = await axios.post('/test',params);
		if(res.data == 1){
			alert('영화입력 성공');
		}
	}
	async function modifyMovie(){
		const params = {
				miName : '신세계',
				miDesc : '헬로',
				miStart : '2022-10-11'
		}
		const res = await axios.put('/test',params);
		if(res.data == 1){
			alert('영화수정 성공');
		}
	}
	async function axiosInit(){
		const params = {
				miNum : 1,
				miName : '신세계',
				miDesc : '헬로'
		}
		const res = await axios.get('/test',{params:params});
		const movies = res.data;
		let html = '';
		
		for(const movie of movies){
			html += '<tr>';
			html += '<td>' + movie.miNum + '</td>';
			html += '<td>' + movie.miName + '</td>';
			html += '<td>' + movie.miStart + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody').innerHTML = html;
	}
	window.addEventListener('load',axiosInit);
</script>
</body>
</html>