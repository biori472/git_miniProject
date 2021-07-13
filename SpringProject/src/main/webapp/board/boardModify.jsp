<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정완료</title>
</head>
<body>

	<script type="text/javascript">
	
		window.onload = function() {

			alert("정보수정완료");
			location.href="boardList.do?pg="+${pg};
			//location.href='../index.jsp';

		}
	</script>

</body>
</html>