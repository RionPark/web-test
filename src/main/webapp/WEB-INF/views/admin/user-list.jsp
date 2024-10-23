<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/codebase/grid.min.js"></script>
<link rel="stylesheet" href="/resources/codebase/grid.css">
</head>
<body>
<div class="container">
	<div id="grid" style="width:900px;height:300px"></div> 
	<div>
		<button onclick="addUser()">추가</button>
		<button onclick="saveGrid()">저장</button>
		<button onclick="deleteGrid()">삭제</button>
	</div>
</div>
<script>
function deleteGrid(){
	const rows = grid.data.serialize();
	const checkedRows = rows.filter(row=>row.rowId);
	const uiNums = rows.filter(row=>row.rowId).map(row=>row.uiNum);
	
	axios.delete('/users',{data:uiNums})
	.then(res=>{
		result = res.data;
		alert(result);
		getMovies();
	});
}
function saveGrid(){
	const rows = grid.data.serialize();
	const checkedRows = rows.filter(row=>row.rowId);
	console.log(checkedRows);
	let result;
	axios.post('/users',checkedRows)
	.then(res=>{
		result = res.data;
		alert(result);
	})
	.catch(err=>{
		alert(err.response.data.message);
	});	
}
function addUser(){
	const newRow = {
			uiNum : 0,
			uiId : '',
			uiName : '',
			credat :''
	}
	const rowId = grid.data.add(newRow);
}
var grid;
function getCheckboxStr(){
	let str = '<label class="dhx_checkbox dhx_cell-editor__checkbox ">';
	str += '<input type="checkbox" class="dhx_checkbox__input dhx_checkbox--check-all">';
	str += '<span class="dhx_checkbox__visual-input "></span>';
	str += '</label>';
	return str;
}
function init(){
	const columns = [
		{width:60, id:'rowId',header:[{text: getCheckboxStr(), htmlEnable:true}],type:'boolean',sortable:false},
		{width:70, id:'uiNum', header:[{text:'번호'}], editable:false},
		{width:200, id:'uiId', header:[{text:'아이디'}], editable:true},
		{width:200, id:'uiPwd', header:[{text:'비밀번호'}], editable:true},
		{width:150, id:'uiName', header:[{text:'이름'}], editable:true},
		{width:150, id:'credat', header:[{text:'가입일'}],editable:true, type: 'date', format: "%Y-%m-%d"  }
	];
	grid = new dhx.Grid('grid',{
		columns : columns,
		leftSplit: 1,
		editable: true,
		dragItem: "both",
		keyNavigation: true,
		selection: "row",
		eventHandlers:{
			onclick:{
				'dhx_checkbox--check-all' : function(event,data){
					grid.data.forEach(row=>{
						grid.data.update(row.id,{[data.col.id]:event.target.checked});
					})
				}
			}
		}
	});
	getMovies();
}
async function getMovies(){
	const res = await axios.get('/users');
	grid.data.parse(res.data);
}
window.addEventListener('load',init);
</script>
</body>
</html>