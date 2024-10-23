<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>DHTMLX Grid 예제</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- DHTMLX CSS -->
<link rel="stylesheet" href="https://cdn.dhtmlx.com/suite/edge/suite.css">
<script src="https://cdn.dhtmlx.com/suite/edge/suite.js"></script>
<link rel="stylesheet"
	href="https://cdn.dhtmlx.com/suite/edge/suite.css">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin-top: 30px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .dhx_grid-header-cell {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }
        .dhx_grid-cell--boolean .dhx_checkbox {
            margin: 0 auto;
        }
        .button-container {
            margin-top: 20px;
            text-align: right;
        }
        button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        #formContainer {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        #itemForm div {
            margin-bottom: 15px;
        }
        #itemForm label {
            display: inline-block;
            width: 100px;
            font-weight: bold;
        }
        #itemForm input[type="text"] {
            width: calc(100% - 110px);
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        #itemForm button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>항목 관리</h1>
        <div id="gridContainer" style="height: 400px; width: 100%;"></div>
        <div class="button-container">
            <button id="addButton">항목 추가</button>
            <button id="editButton">선택 항목 수정</button>
            <button id="deleteButton">선택 항목 삭제</button>
        </div>
        <div id="formContainer" style="display: none;">
            <h3 id="formTitle">항목 추가/수정</h3>
            <form id="itemForm">
                <input type="hidden" id="itemId">
                <div style="display: flex; flex-direction: column; gap: 10px;">
                    <div>
                        <label for="itemName">이름:</label>
                        <input type="text" id="itemName" required>
                    </div>
                    <div>
                        <label for="itemDescription">설명:</label>
                        <input type="text" id="itemDescription" required>
                    </div>
                    <div>
                        <button type="submit">저장</button>
                        <button type="button" id="cancelButton">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<script>
var grid;
window.addEventListener('load', function() {
    grid = new dhx.Grid('gridContainer', {
        columns: [
            { 
                width: '10%', 
                id: 'checkbox', 
                header: [{ text: '선택', align: 'center' }], 
                type: 'boolean',
                align: 'center',
                editorType:'checkbox',
                editable: true,
                sortable:false,
            },
            { width: '20%', id: 'id', header: [{ text: 'ID' }], editable: false },
            { width: '35%', id: 'name', header: [{ text: '이름' }], editable: true },
            { width: '35%', id: 'description', header: [{ text: '설명' }], editable: true }
        ],
        selection: 'row',
        multiselection: true,
        autoWidth: true,
        data: []
    });

    loadData();

    document.querySelector('#deleteButton').addEventListener('click', deleteSelectedItems);
    document.querySelector('#addButton').addEventListener('click', addRow);
});
function addRow() {
    const newRowId = grid.data.add({});  // 그리드 하단에 빈 로우 추가
    grid.selection.setCell(newRowId, "name");  // 새로 추가된 로우의 'name' 열로 포커스 이동
    grid.paint(); // 그리드 다시 그리기
    
    // 수정된 부분
    setTimeout(() => {
        if (grid.data.exists(newRowId)) {
            const rowIndex = grid.data.getIndex(newRowId);
            grid.scrollTo(rowIndex,0);  // 행 인덱스를 사용하여 스크롤
        }
    }, 100);
}

function loadData() {
    axios.get('/admin/api/items')
        .then(function (response) {
        	const items = response.data.map(item=>({
        		...item,checkbox:false
        	}))
            grid.data.parse(items);
        	console.log(items);
        })
        .catch(function (error) {
            console.error('데이터 로딩 중 오류 발생:', error);
        });
}

function deleteSelectedItems() {
    const selectedIds = grid.data.serialize()
    .filter(item => item.checkbox) 
    .map(item => item.id);
    
    if (selectedIds.length === 0) {
        alert('삭제할 항목을 선택해주세요.');
        return;
    }

    if (confirm('선택한 ' + selectedIds.length + '개의 항목을 삭제하시겠습니까?')) {
        axios.delete('/admin/items', { data: selectedIds })
            .then(function (response) {
                alert(response.data);
                loadData(); // 데이터 다시 로드
            })
            .catch(function (error) {
                console.error('삭제 중 오류 발생:', error);
                alert('삭제 중 오류가 발생했습니다.');
            });
    }
}
</script>
</body>
</html>