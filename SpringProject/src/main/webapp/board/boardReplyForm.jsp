<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<title>boardWriteForm</title>
<style type="text/css">

*{
font-family: 'Noto Serif KR', serif;
font-weight: bold;
font-size : 12px;
}

.content {
overflow : auto;
}
input[type='button'],input[type='reset']{ 
color: #263343;
width : 80px;
}

</style>

</head>
<body>

	<form id="boardReplyForm">
	
	<input type="hidden" id="pseq" name="pseq" value="${pseq}"> 
	<input type="hidden" id="pg" name="pg" value="${pg}">

		<h1 align="center">답글쓰기</h1>

				<table border="2" id="table" cellspacing="0" cellpadding="10" bordercolor="#232526" align="center">

					<tr>
						<td align="center">제목</td>
						<td><input type="text"  id="subject" name="subject" placeholder="제목 입력"
							size="100" style= "border:0; width:500px;">
							<div id="subjectDiv"></div></td>
					</tr>

					<tr>
						<td align="center">내용</td>
						<td><textarea name="content" id="content"  placeholder="내용 입력" style="width:500px; height:180px; 
							border:0; resize:none;"></textarea>
							<div id="contentDiv"></div></td>
					</tr>

					<tr>
						<td colspan="2" align="center">
						<input type="button" value="답글작성" id="boardReplyBtn">
						<input type="reset"	value="다시작성"></td>
					</tr>
				</table>
				
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/spring/js/board.js"></script>	
	
</body>
</html>