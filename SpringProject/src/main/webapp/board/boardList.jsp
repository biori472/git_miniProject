<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<style type="text/css">

*{
font-family: 'Noto Serif KR', serif;
font-weight: bold;
font-size: 12px;

}

a {
	color: #263343;
}

a:hover {
	color: gold;
	transition: 0.3s;
	cursor: pointer;
}

.text {
	width: 100px;
	height: 20px;
	color: #263343;
}

td {
	color: #263343;
}

hr {
	color: #263343;
	border: 2px dashed white;
	"
}

#currentPaging {
	color: red;
	text-decoration: underline; /**/
		cursor: pointer;
}

#paging {
	color: #263343;
	text-decoration: none;
	align-items: center;
		cursor: pointer;
}

</style>
</head>

<body>

<form id="ListSearchForm">

<input type="hidden" id="pg"  value="${pg}">

	<h1 align="center">게시판 목록</h1>

		<hr>
		<br>

		<table border="1" id="table" cellpadding="5" width="550"
			bordercolor="#263343" align="center" frame="hsides" rules="rows">
			<tr class="text">
				<th width="100px">글번호</th>
				<th width="330px">제목</th>
				<th width="100px" align="center">작성자</th>
				<th width="100px" align="center">작성일</th>
				<th width="100px" align="center">조회수</th>
			</tr>
		</table>
		
		
		<table border="1" id="boardListTable" cellpadding="5" width="800px" bordercolor="white" align="center" frame="hsides" rules="rows">
		
			<tr class="text">
				<th width="100px">글번호</th>
				<th width="300px">제목</th>
				<th width="100px" align="center">작성자</th>
				<th width="100px" align="center">작성일</th>
				<th width="100px" align="center">조회수</th>
			</tr>
		<!-- 동적 태그 들어오는 곳 -->
		</table>

		<br>

		<div id="boardPagingDiv" align="center">
			<div style="width: 750px;  text-align: center;"></div>
		</div>
			<%--
			 <div style="width: 750px; text-align: center;">
			${boardPagingSearch.pagingHTML}</div> --%>
			

		</form>
		
		<form id="searchForm"><!--강사님 boardSearchForm -->
		<input type="hidden" name="pg" id="hiddenPg" value="1">
		<!-- 검색한 내용을 1페이지 부터 보여주기 위해서 boardController 로 보낸다. -->
			<div style="width: 750px; text-align: center;">
				<select name="searchOption" id="searchOption">
					<option value="subject">제목</option>
					<option value="id">작성자</option>
				</select>
				<input type="search" name="keyword" id="keyword" value="${keyword}">
				<input type="button" id="boardSearchBtn" value="검색">
			</div>
		</form>
 		<!-- 검색 form -->


<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/spring/js/boardList.js"></script>

<script type="text/javascript">

	//페이징처리
	function boardPaging(pg){
		
		var keyword = document.getElementById('keyword').value;
				//alert(keyword);
		if(keyword==''){
			location.href = 'boardList?pg='+pg;
		}else{//키워드 있으면, 강제 트리거 발생. 
			// 1번인경우 , trigger눌러 [2]에서 다시 검색 버튼을 누를경우 2페이지 부터 검색한다. 
			//먼저 페이지 1페이지 가지 않도록 바꿔주기
		
			$('input[name=pg]').val(pg);	//form안의 pg값이 1로 고정되어 있기 때문.		
			$('#boardSearchBtn').trigger('click');
			$('input[name=pg]').val(1);
			//만약 검색 버튼을 눌렀을 때 1페이지 부터 다시 검색하도록 pg를 바꿔주어야한다.
			/* location.href = 'boardSearch?pg='+pg;
					+'&searchOption=${searchOption}&keyword='+encodeURIComponent('${keyword}'); */
			//2번인 경우 , 
			
			/*
			$('#boardSearchBtn').trigger('click','research');
			lit.js에서 $('#boardSearchBtn').click(function(event,str){
				if(str!='research')검색을 누른 상태  $('input[name=pg]').val(1);
			*/
		}
	}
	
	</script>

</body>
</html>