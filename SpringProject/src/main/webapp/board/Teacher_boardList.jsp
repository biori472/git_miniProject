<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	color: green;
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
}

#paging {
	color: #263343;
	text-decoration: none;
	align-items: center;
}

</style>
</head>

<body>

	<form name="boardListForm" id="boardListForm" method="post" action="/miniProject/board/boardView.do">
	
	

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

			<c:if test="${list != null}">
			<!-- requestScope. -->
			<c:forEach var="boardDTO" items="${list}">
		
			<tr class="data">
			
				<td id="seq" align="center">${boardDTO.seq}</td>
				
					<td id="subject" align="left">
				
						<c:forEach var="i" begin="1" end="${boardDTO.lev}" step="1">
							&emsp;
						</c:forEach>
					
						<a href="javascript:void(0)" onclick="checkLogin('${memId}',${boardDTO.seq},${pg})">
						
						<c:if test="${boardDTO.pseq != 0}">
							<img src="../img/reply.gif">
						</c:if>
						
						${boardDTO.subject}	</a>
						
					</td>
					
				<td align="center">${boardDTO.id}</td>
				
				<td align="center">
				<fmt:formatDate pattern="YYYY.MM.dd" value="${boardDTO.logtime }" />
 				</td>
				<!-- 데이터 형식 변경해주기 -->
				<td align="center">${boardDTO.hit}</td>
			</c:forEach>
			</c:if>
			
		</table>
		

		<br>

		<div id="page" align="center">
		
			<c:if test="${keyword==null}" >
			<div style="width: 750px; text-align: center;">${boardPaging.pagingHTML}</div>
			</c:if>
			
			<c:if test="${keyword!=null}" >
			<%--
			 <div style="width: 750px; text-align: center;">
			${boardPagingSearch.pagingHTML}</div> --%>
			 
				<div style="width: 750px; text-align: center;">
				
				<!-- 보드페이징......... -->
					
					<c:if test="${ boardPagingSearch.startPage > boardPagingSearch.pageBlock}">
						<a id='paging' href="boardSearch.do?pg=${boardPagingSearch.startPage-1}&keyword=${keyword}&select=${select}">[이전]</a>
					</c:if>
								
					<c:forEach var="i" begin="${boardPagingSearch.startPage}" end="${boardPagingSearch.endPage}" >
						<c:choose>
							<c:when test="${ i == boardPagingSearch.currentPage}">
								<a id='currentPaging' href="boardSearch.do?pg="${i}>[${i}]</a>
							</c:when>
		
							<c:otherwise>
								<a id='paging' href="boardSearch.do?pg=${i}&keyword=${keyword}&select=${select}">[${i}]</a>
							</c:otherwise>
		
						</c:choose>
					</c:forEach>
				
					<c:if test="${ boardPagingSearch.endPage < boardPagingSearch.totalP }">
						<a id='paging' href="boardSearch.do?pg=${boardPagingSearch.endPage+1}&keyword=${keyword}&select=${select}">[다음]</a>
					</c:if>
					
				</div>
			
			

			
			</c:if> 
			
			<!-- boardPaging.getPagingHTML() -->
			<!--  <img src="../img/dance.gif" width="100" height="100" alt="두둠칫둠칫"
				onclick="location.href=''" style="cursor: pointer;">
				Click image and Move to Main -->
			
		<br><br>	
		</div>
		
		
	</form>

		<!-- form 새로 생성 ~ -->
		<form method="post" action="/miniProject/board/boardSearch.do">
			<input type="hidden" name="pg" value="1">
			
			<div id="search" align="center">
				<select name="searchOption" id="category" onfocus="${select}">
			  		<option value="subject">제목</option>
			  		<option value="id">작성자</option>
				</select>
					<input type="search" id="keyword" name="keyword">
					<input type="submit" value="검색">
	
			</div>

 		</form>	
 		<!-- form -->


<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	/* window.onload=function(){
	 	document.boardListForm.category.value='${select}';
	 	
	} */
	
	function checkLogin(memId,seq,pg){
		if(memId==''){
			alert("먼저 로그인 하세요.");
		}else {
			location.href="boardView.do?seq="+seq+"&pg="+pg;
		}
	}

	$(function(){
	
		var keyword;
		var select;
		
		$('#search').click(function(){
			
			keyword = $("#keyword").val();
			console.log(keyword);
			
			if($('#search > select > option:selected').index() > 0)
				select = $('#search > select > option:selected').val();
				console.log(select);
				/*alert("여기까지 왔냐...?")*/
			
			if(keyword!='' && select!='') {
				location.href="boardSearch.do?keyword="+keyword+'&select='+select+'&pg='+"1";
				//pg값 페이징 처리할 때 넘겨주기
			}

		});
	});
	
	$(function(){
		
		var choice;
		var seq;
		$('#subject').click(function(){
			choice =$('#subject').val();
			seq=$('#seq').val();
			console.log(choice+","+seq);
		});
		
	});
	
	



	</script>

</body>
</html>