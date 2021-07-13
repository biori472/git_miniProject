<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- DTO class --%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<title>회원가입</title>

<style type ="text/css">
*{
font-family: 'Noto Serif KR', serif;
font-weight: bold;
font-size: 12px;
}

table {background-color :#edeef7;}

div#subjectDiv , div#contentDiv{
color : black;
}
input{
width : 150px;
outline : none;
border : 1px solid lightgray;
padding : 5px 10px;
transition : 0.4s;
}
input:focus{
border-color : blue;
width : 110px;
}
active:active{
background-color : #dff4f3;
}
#checkPost{
width:100px;
}

</style>

</head>
<body>

<h1 align="center">회원가입</h1><br>

	<form id="writeForm">
		<table border="2" cellspacing="0" cellpadding="10" bordercolor="#a6b1e1" align="center">
			<tr>
				<td id="nameTable" align="center">이 름</td>
				<td><input type="text" name="name" id="writeFormName" placeholder="이름 입력" size="25" class="focusIn">
				<div id= "writeFormNameDiv" ></div>
				</td>
			</tr>

			<tr>
				<td id="idTable" align="center">아이디</td>
				<td><input type="text" name="id" id="writeFormId" placeholder="아이디 입력" size="25" class="focusIn">
					<input type="hidden" name="check" id="check" value=""> 
					<div id= "writeFormIdDiv"></div>
				</td>
			</tr>

			<tr>
				<td id="pwdTable" align="center">비밀번호</td>
				<td><input type="password" name="pwd" id="writeFormPwd" size="25" class="focusIn">
				<div id= "writeFormPwdDiv"></div>
				</td>
			
			</tr>

			<tr>
				<td id="pwdReTable" align="center">재확인</td>
				<td><input type="password" name="pwdRe" id="writeFormPwdRe" class="focusIn"
					placeholder="동일한 비밀번호 입력" size="25">
				<div id= "writeFormPwdReDiv"></div>
				</td>
			</tr>
			
			<tr>
				<td id="genderTable" align="center">성 별</td>
				<td><input type="radio" name="gender" id="gender" value="0" checked>남
					<input type="radio" name="gender" id="gender" value="1">여
				</td>
			</tr>

			<tr>
				<td id="emailTable" align="center">이메일</td>
				<td><input type="text" name="email1" id="email1" size="20"> 
				@ 
				<input	type="email" list="email2" name="email2" id="email2" size="12" placeholder="직접입력"> 
				<div id= "email1Div"></div>		
					<datalist id="email2">
						<option value="gmail.com"></option>
						<option value="hanmail.net"></option>
						<option value="naver.com"></option>
					</datalist>
				<div id= "emailDiv"></div>	
				</td>
			</tr>

			<tr>
				<td id="tel1Table" align="center">핸드폰</td>
				<td><select name="tel1" id="tel1" size="1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
						</select> 
				-
				<input type="text" name="tel2" id="tel2" size="8" maxlength="4"> 
				-
				<input type="text" name="tel3" id="tel3" size="8" maxlength="4"></td>
			</tr>

			<tr>
				<td id="addressTable" align="center">주 소</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly> 
					<input type="button" value="우편번호검색" id="checkPost"> <br> 
					<input type="text" name="addr1" id="addr1" placeholder="주소" size="50" readonly> <br> 
					<input type="text" name="addr2" id="addr2" placeholder="상세주소" size="50">
					<div id= "addrDiv"></div>	
					
					</td>
			</tr>

			<tr>
				<td class="active"colspan="2" align="center">
				<input type="button" value="회원가입" id="writeFormSignIn">
				<input type="reset" value="다시등록"></td>
			</tr>
		</table>
	</form>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script src="/spring/js/member.js"></script>
</body>
</html>