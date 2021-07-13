<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<title>회원정보수정</title>

<style type="text/css">
*{
font-family: 'Noto Serif KR', serif;
font-weight: bold;
font-size: 12px;
}

div {
	color: black;
	cursor: pointer
}

input{
width : 100px;
outline : none;
border : 1px solid lightgray;
padding : 5px 10px;
transition : 0.4s;
}
input:focus{
border-color : blue;
width : 110px;
}
table {
background-color : #edeef7;
}

</style>

</head>

<body>
	<!--응답  아이디 변경 x, 디비에서 정보 받아 뿌리기  -->

	<h3 align="center">회원정보수정</h3>

	<form name="modifyForm" method="post" action="/spring/member/modify">

		<table border="2" cellspacing="0" cellpadding="10" bordercolor="#a6b1e1" align="center">

			<tr>
				<td align="center">이 름</td>
				<td><input type="text" name="name" id="name" placeholder="이름 입력"
					size="25" value="${memberDTO.name}">
					<div id="nameDiv"></div></td>
			</tr>

			<tr>
				<td align="center">아이디</td>

				<td><input type="text" name="id"  id="id" placeholder="아이디 입력" size="25"
					value="${memberDTO.id}" readonly></td>

			</tr>

			<tr>
				<td align="center">비밀번호</td>
				<td><input type="text" name="pwd" id="pwd" size="25">
					<div id="pwdDiv"></div></td>
			</tr>

			<tr>
				<td align="center">재확인</td>
				<td><input type="password" name="pwdRe" id="pwdRe"
					placeholder="동일한 비밀번호 입력" size="25">
					<div id="pwdDiv2"></div></td>
			</tr>
			<tr>
				<td align="center">성 별</td>
				<td>
				<input type="radio" name="gender" id="gender" value="0">남 
				<input type="radio" name="gender" value="1">여</td>
			</tr>

			<tr>
				<td align="center">이메일</td>
				<td><input type="email" name="email1" size="20"
					value="${memberDTO.email1}"> @ <input type="email" list="email2"
					name="email2" size="12" value="${memberDTO.email2}" placeholder="직접입력">
					<datalist id="email2">
						<option value="gmail.com"></option>
						<option value="hanmail.net"></option>
						<option value="naver.com"></option>
					</datalist></td>
			</tr>

			<tr> 
				<td align="center">핸드폰</td>
				<td><select name="tel1" size="1" value="${memberDTO.tel1}" onfocus="${memberDTO.tel1}">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
				</select> - <input type="text" name="tel2" size="8" maxlength="4"
					value="${memberDTO.tel2}"> - <input type="text" name="tel3"
					size="8" maxlength="4" value="${memberDTO.tel3}"></td>
			</tr>


			<tr>
				<td align="center">주 소</td>
				<td><input type="text" name="zipcode" id="zipcode" readonly
					value="${memberDTO.zipcode}"> <input type="button" value="우편번호검색"
					onclick="checkPost()"> <br> <input type="text"
					name="addr1" id="addr1" placeholder="주소" size="50" readonly
					value="${memberDTO.addr1}"> <br> <input type="text"
					name="addr2" id="addr2" placeholder="상세주소" size="50"
					value="${memberDTO.addr2}"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="button" value="회원정보수정" id="modifyBtn"> <input
					type="reset" value="다시등록" onclick="location.reload()"> <input
					type=button value="뒤로가기" onClick="history.back()">
				</td>
			</tr>
		</table>
	</form>

	<script src="/spring/js/member.js"></script>

</body>
</html>