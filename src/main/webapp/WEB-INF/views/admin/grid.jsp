<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/codebase/grid.js"></script>
<link rel="stylesheet" href="/resources/codebase/grid.css">
</head>
<body>
<div class="container">
	<div id="grid" style="width:600px;height:200px"></div>
</div>
<script>
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
		{width:70, id:'miNum', header:[{text:'번호'}], editable:false},
		{width:200, id:'miName', header:[{text:'영화명'}], editable:true},
		{width:150, id:'miStart', header:[{text:'개봉일'}], editable:true}
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
	const res = await axios.get('/movies2');
	grid.data.parse(res.data);
}
window.addEventListener('load',init);
</script>
</body>
</html>