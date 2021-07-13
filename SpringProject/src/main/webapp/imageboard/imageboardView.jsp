<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style type="text/css">
* {
	font-family: 'Noto Serif KR', serif;
	font-weight: bold;
	font-size: 14px;
}
</style>
</head>
<body>
	<form name="boardViewForm">
		<input type="hidden" name="pg" id="pg" value="${pg}" />
		<input type="hidden" name="seq" id="seq" value="${seq}" />

		<h1 align="center">이미지 게시판 상세페이지</h1>

		<table border="2" id="table" cellspacing="0" cellpadding="10"
			bordercolor="#d6e6f2" align="center" frame="hsides" rules="rows"
			width="500">

			<tr>
				<td rowspan="4" class="image">
				<img id="image1" width="250px" height="250px">
				</td>
				<td>상품명 : <span id="imageNameSpan"></span>
			</tr>

			<tr>
				<td>가격 : <span id="imagePriceSpan"></span>
				</td>
			</tr>

			<tr>
				<td>개수 :<span id="imageQtySpan"></span>
				</td>
			</tr>

			<tr>
				<td><span id="totalSpan"></span></td>
			</tr>

			<tr>
				<td colspan="2" align="center" height="300px"><span
					id="imageContentSpan"></span></td>
			</tr>


			<tr>
				<td colspan="2" align="right">
				<input type="button" value="목록" onclick="location.href='imageboardList?pg=${pg}'"></td>
			</tr>


		</table>


	</form>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {

			$.ajax({
				url : '/spring/imageboard/getImageboardView',
				type : 'post',
				dataType : 'json',
				data : 'seq=${seq}',
				//data:$('#imageboardListForm').serialize(),
				success:function(data) {
					console.log(data);
					var total=data.imageboardDTO.imageQty*data.imageboardDTO.imagePrice;
					$('#image1').attr('src','../storage/'+data.imageboardDTO.image1);
					$('#imageNameSpan').text(data.imageboardDTO.imageName)
					$('#imageQtySpan').text(data.imageboardDTO.imageQty)
					$('#imagePriceSpan').text(data.imageboardDTO.imagePrice.toLocaleString())
					$('#imageContentSpan').text(data.imageboardDTO.imageContent)
					$('#totalSpan').text(total.toLocaleString())
				},
				error:function(err) {
					console.log(err)
				}
			});

		});
	</script>
</body>
</html>