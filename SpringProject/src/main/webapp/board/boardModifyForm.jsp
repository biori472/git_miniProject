<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<style type="text/css">

table {
width : 600px;
}
.subject{
font : bold 20px ;
}
.content{
font : bold 20px ;
}
input,textarea{ 
font : bold 20px ;
white-space: pre-line;

}
input[type=text]{
width : 500px;
height :20px;
outline : none;
border : 1px solid lightgray;
padding : 5px 10px;
transition : 0.4s;
font-size :15px ;
margin: 0;
}
textarea{
outline : none;
border : 1px solid lightgray;
padding : 5px 10px;
transition : 0.4s;
font-size : 15px ;
margin: 0;
}


</style>

</head>
<body>
	<form name="boardModifyForm">
		<input type="hidden" id="seq" name="seq" value="${seq}">
		<input type="hidden" id="pg" name="pg" value="${pg}">
		
		<div align="center">글 수정</div><br>
				
			<table border="2" id="table" cellspacing="0" cellpadding="10" 
				bordercolor="#d6e6f2" align="center">
				
				<tr>
				<td class="subject">제목</td>
				<td><input type="text" size="40" name="subject" id="subject">
				
				<div id="subjectDiv"></div>
				</td>
				</tr>
				
				<tr>
				<td class="content" height="200px">내용</td>
				<td><textarea name="content" cols="62" rows="10" id="content" resize:none> </textarea>
				<div id="contentDiv"></div>
				</tr>
				
				<tr>
				<td colspan="2" align="center">
				<input type="button" value="글수정" id="boardModifyBtn"> </td>
				</tr>
				
			</table>
			
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/boardModify.js"></script>

<!-- 

	<script type="text/javascript">
	
	function checkBoardModify(){
		
		/*초기화 하기*/
		document.getElementById("subjectDiv").innerText = "﻿";
		document.getElementById("contentDiv").innerText = "";
		
		if(document.boardModifyForm.subject.value==""){
			document.getElementById("subjectDiv").innerText = "﻿제목을 입력하세요.";
			document.boardModifyForm.subject.focus();
			
		} else if(document.boardModifyForm.content.value==""){
			document.getElementById("contentDiv").innerText = "﻿내용을 입력하세요.";
			document.boardModifyForm.content.focus();
		} else {
			/*location.href="boardModify.jsp?pg="+pg;*/
			/*location.href="boardModify.jsp";*/
			document.boardModifyForm.submit();
			
		}				
	}
</script> -->
		
	
</body>
</html>