<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>imageboardWriteForm</title>
<style type="text/css"></style>

</head>
<body>

	<%-- 1번. submit으로 넘기기(단순 submit) --%>
	<%--<form id="imageboardWriteForm" name="imageboardWriteForm" 
	method="post" enctype="multipart/form-data" action="imageboardWrite"> --%>
	
	<!-- AJAX통신 -->
	<form id="imageboardWriteForm">
	
			<h1 align="center" >관리자_이미지 추가</h1>
			
			<table border="2" id="table" cellspacing="0" cellpadding="10" bordercolor="black" align="center">
			
					<tr>
						<td>상품코드</td>
						<td><input type="text" name="imageId" id="imageId" placeholder="상품코드를 입력하세요" size="50" >
							<div id="imageIdDiv"></div></td>
					</tr>
					
					<tr>
						<td>상품명</td>
						<td><input type="text" name="imageName" id="imageName" placeholder="상품명을 입력하세요" size="50" >
							<div id="imageNameDiv"></div></td>
					</tr>
					
					<tr>
						<td>단가</td>
						<td><input type="text" name="imagePrice" id="imagePrice" placeholder="상품의 가격을 입력하세요" size="50" >
							<div id="imagePriceDiv"></div></td>
					</tr>
					
					<tr>
						<td>개수</td>
						<td><input type="text" name="imageQty" id="imageQty" placeholder="상품의 개수를 입력하세요" size="50" >
							<div id="imageQtyDiv"></div></td>
					</tr>

					<tr>
						<td>내용</td>
						<td><pre><textarea name="imageContent" id="imageContent" placeholder="내용 입력"></textarea></pre>
							<div id="imageContentDiv"></div></td>
					</tr>

					<tr>
						<td colspan="2" align="left">
						<input type="file" name="img" size="50">
					</tr>
					
					<tr>
						<td colspan="2" align="left">
						<input type="file" name="img" size="50">
					</tr>
					
					<!-- 한번에 여러개의 파일을 선택하고 싶을때? -->
					<tr>
						<td colspan="2" align="left">
						<input type="file" name="img[]" multiple size="50">
					</tr>
					
					
					<tr>
						<td colspan="2" align="center">
						<input type="button" id="imageboardWriteBtn" value="이미지등록">
						<input type="reset"	 value="다시작성" >
						</td>
					</tr>
				</table>
		</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script src="/spring/js/imageboard.js"></script>

</body>
</html>