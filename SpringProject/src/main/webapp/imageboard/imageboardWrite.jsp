<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>imageboardWrite</title>
</head>
<body style="background: linear-gradient(to right, #414345, #232526);  color:white;">
<%--  응답  --%>

<script type="text/javascript">

	window.onload=function(){
	alert("이미지 등록이 완료되었습니다.");
	location.href="/miniProject/imageboard/imageboardList.do?pg=1";
}

</script>
</body>
</html>