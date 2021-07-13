<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body{
margin:0;
color:black;
}

.mainnav {
	background-color: #e1e5ea;
	list-style: none;
	text-align: center;
	margin:0;
	padding: 0;
	
}

.mainnav:after {
	/*container-snb,content 오른쪽에  바로 붙지 않게 하기 위해서 미리해제. clear 함 */
	content: '';
	display: block;
	clear: both;
}

.mainnav li {
	display : inline-block;
	justify-content: space-between;
	margin-left:150px;
	
}

.mainnav li a {
	display: block;
	padding: 0 0px;
	background-color: #e1e5ea;
	color: #334443;
	font: bold 16px/40px 'Noto Serif KR', serif;
	/*굵기 크기, line-height (줄간격) 글꼴 */
	text-transform: uppercase;
	text-decoration: none;
}

.mainnav li a:hover {
	color: #660000;
	background-color: #ffcc00;
}
</style>

</head>
<body>


<div class="menu1" align="center">
	<ul class="mainnav">
		
		<c:if test="${sessionScope.memId != null}">
		<li><a href="/spring/board/boardWriteForm">글쓰기</a></li>
		<li><a href="/spring/imageboard/imageboardWriteForm">이미지등록</a></li>
		</c:if>
		<!-- "/spring/board/boardList?pg=1" -->
		<li><a href="/spring/board/boardList">목록</a></li>
		<li><a href="/spring/imageboard/imageboardList">이미지목록</a></li>
	</ul>
</div>

<script type="text/javascript"src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"></script>
</body>
</html>