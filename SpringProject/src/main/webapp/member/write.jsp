<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입처리</title>
</head>
<body>


		<c:if test="${su==1}">
		<h1 align="center">"회원가입성공"</h1>
		</c:if>
		
		<c:if test="${su==0}">
		
		<h1>"회원가입실패"</h1>
		</c:if>

</body>
</html>
