<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardView</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Nanum Gothic';
}
.content {
	/*수직정렬*/
	width: 200px;
	height: 300px;
	font: bold 'Nanum Gothic';
	/*background:#e1e5ea;*/
	/*text-overflow : clip;*/
}
table{
font-size: 20px;
}

td {
	width: 100px;
	text-align: "center";
}

th {
	width: 200px;
	/*background: #e1e5ea;*/
	text-align: "center";
}

pre{
   word-wrap :word-break;
   white-space: pre-wrap;
   word-break: break-all;

}
</style>
</head>
<body>
	<form name="boardViewForm" >	
		<input type="hidden" name="seq" id="seq" value="${seq}"> 	<!--강사님:boardDTO.seq -->
		<input type="hidden" name="pg" id="pg" value="${pg}">	<!--강사님:pg -->
		

		<h1 align="center">게시판 상세페이지</h1>

		<table border="2" id="table" cellspacing="0" cellpadding="10"
			bordercolor="#d6e6f2" align="center" frame="hsides" rules="rows"
			width="500">

			<tr>
				<td align="center" colspan="3" class="title"><span id="subjectSpan"></span></td>
			</tr>
			<br>

			<tr>
				<th>글번호: <span id="seqSpan">  ${boardDTO.seq}</span></th>
				<th>작성자 : <span id="idSpan"> ${boardDTO.id}</span></th>
				<th>조회수 : <span id="hitSpan"> ${boardDTO.hit}</span></th>
			</tr>

			<tr>
			<!-- 
	- 엔터를 안치고 글을 옆으로 길게 쓴 경우
	- 엔터를 계속 쳐서 글이 밑으로 길게 쓴 경우
	 -->
				<td class="content" colspan="3" valign="top">
				<div align="center" style="width:100%; height:100%; overflow:auto;">
				<pre style="white-space:pre-line; word-break: break-all;">${boardDTO.content}
				<span id="contentSpan"></span></pre></div></td>
				<!-- 
				<td class="content" colspan="3" valign="top" 
				style="white-space:pre-line; word-break: break-all;">
				<div style="width:100%; height:100%; margin:0; overflow:auto; 
				white-space:nowrap; word-break: break-all;"><pre>${boardDTO.content}
				</pre></div></td>
				 -->
		
			</tr>

			<tr>
				<td colspan="3" align="left">
				<input type="button" value="목록" onclick="location.href='boardList?pg=${pg}'">
				
					<span id="boardViewSpan" >
						<input type="button" value="글수정" onclick="mode(1)"> 
						
						<input type="button" value="글삭제" onclick="mode(2)"> <!-- id="deleteBtn" -->
					</span>
						<input type="button" value="답글" onclick="mode(3)">
					
			</tr>
		</table>
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/spring/js/boardView.js"></script>

	<script type="text/javascript">
		function mode(num) {

			if (num == 1) {//글수정
				document.boardViewForm.method = "post";
				document.boardViewForm.action = "boardModifyForm";
				document.boardViewForm.submit();

			} else if (num == 2) {//글삭제
				if (confirm("정말 삭제하시겠습니까?")) {
				document.boardViewForm.method = "post";
				document.boardViewForm.action = "boardDelete";
				document.boardViewForm.submit();
				} 
				else {
		        alert("다시 목록으로 돌아갑니다.");
		        }
			
			} else if (num == 3) {//답글
				document.boardViewForm.method = "post";
				document.boardViewForm.action = "boardReplyForm";
				document.boardViewForm.submit();

			}
		}
	</script>

</body>
</html>