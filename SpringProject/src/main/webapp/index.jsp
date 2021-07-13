<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
	margin: 0;
	padding: 0;
	height: 100%;
	width : auto ;
}

#header {
	margin:0;
	background : black;
	color: white;
	width:  auto;
	height: 0%;
	text-align: center;
	border: 1px solid lightgray;
}

.menu1, .menu2{
padding: 0px;
}

#container {

	width: auto;
	height: 700px; 
	border: 1px solid lightgray;
}

#container:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

#nav {
	text-align: center;
	margin-left : 0px;
	position : absolute;
	width: 300px;
	height: 100%;
	float: left;
	/*border: 2px dotted #e1e5ea;*/
	/*border-right: 1px dotted #7BAEB5;*/
}

#section {

	position : absolute;
	margin-left: 334px;
	width: 1000px;
	height: 100%;
	float: left;
	/*border: 2px dotted #e1e5ea;*/
	
}
#indexPicture{ margin-left: 430px;}
#main{margin-left: 350px;} 
#pooh{margin-left: 200px;}

#footer {
	width: 100%;
	height: 10%;
	border: 2px dotted #e1e5ea;
}

div#subjectDiv , div#contentDiv{
color : black;
font-size : 8pt;
font-weight : bold;
}

#header>h1{
align-content: flex-start;
padding-top: -20px;
}

</style>
</head>
<body>

<div id="header">
	<h1>
		<img src="/spring/image/olaf.png" width="60" height="70" alt="올라프" 	style="cursor:pointer;">&ensp;MINI PROJECT
		<img src="/spring/image/olaf.png" width="60" height="70" alt="올라프" 	>
	</h1>
	<jsp:include page="/member/titlebar.jsp" />
</div>

<div id="container">
	
		<div id="nav">
				<jsp:include page="/main/menu.jsp" />
		</div>	

		<div id="section">
			<c:if test="${empty display }">
			<div id="indexPicture" style= " margin-top: 20px;">
			<img src="/spring/image/miky.png" width="200" height="200" alt="디즈니" onclick="location.href='#'"	style="cursor:pointer;">
		</div>
		
			<h1 id="main">
				Welcome to MinjiWorld<br>
				Hava a nice day &<br>
				<!-- <img src="/miniProject/image/chun.gif" width="70" height="70" alt="춘">
				 -->
			</h1>
			
			<p id="pooh" >
			Life is a journey to be experienced, not a problem to be solved - Winnie the Pooh
			</p>
			
		</c:if>
		<c:if test="${not empty display}">
			<jsp:include page="${display}" />
		</c:if>
		
	</div>
</div>




<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#section>#main').animate({opacity:0, fontSize:'0px'},200,
			function(){
			$('#section>#main').animate({opacity:1, fontSize:'30px'},200);
		});
	});
	</script>
</body>
</html>




