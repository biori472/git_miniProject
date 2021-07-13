<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="member.dao.MemberDAO"%>
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckId</title>

<script type= "text/javascript">

function clickIdClose(){
	<!-- 사용가능한 아이디를 회원가입 아이디에 넣어주고, 새창 닫아주고, 비밀번호에 포커스 맞추기 opener-->
	opener.writeForm.id.value = '${param.id}';
	opener.writeForm.checkID.value = '${param.id}';
	window.close();
	opener.writeForm.pwd.focus();
}

</script>

</head>
<body>

<form name="checkId" method="post" action="checkId.do">

${param.id }는 사용 가능<br><br>
<!-- param.id 도 가능.  -->
<input	type="button" value="사용하기" onclick="clickIdClose()" >
</form>


</body>
</html>