<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginOk</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<style type="text/css">
*{
font-family: 'Noto Serif KR', serif;
font-weight: bold;
}
</style>
</head>
<body>


		<br>
		${sessionScope.memName} 님이<br> 로그인 하셨습니다. <br><br>
		<input type="button" value="로그아웃" onclick="location.href='/spring/member/logout'">
		<input type="button" value="회원정보수정" id="login_ModifyBtn"> 
		<!-- 		<img src="../image/chun.gif" alt="메인으로" width="100" height="100">		
		<a href="../index.jsp" >메인으로</a>
-->
		
		<!-- 위치 작성 방법 -->
		<!-- full 주소 : "location.href='/miniProject/member/logout.do'" -->
		<!-- onclick="location.href='logout.do'" -->
		<!-- logout.do -->
		
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script src="/spring/js/member.js"></script>

</body>
</html>