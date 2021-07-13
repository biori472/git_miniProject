<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<title>Login</title>

<style type="text/css">

*{
font-family: 'Noto Serif KR', serif;
font-weight: bold;
}

#login{
margin : 0;
font-size : 15px ;
color: black;
}
input{
width : 100px;
outline : none;
border : 1px solid lightgray;
padding : 5px 10px;
transition : 0.4s;
font-size : 10px ;
}
input:focus{
border-color : blue;
width : 100px;
font-size : 10px;
}
input[type=button]{

width : 60px;
font-size : 9px;
}
#logintable {
background-color : #edeef7;
width:200px;
height: 80px;
}
#idTable, #pwdTable {
width: 80px;
font-size : 10px;
}
</style>
</head>
<body>

<div id="login" align="center">로그인</div><br>

	<form name="LoginForm">

	<table id="logintable" border="2" cellspacing="0" cellpadding="10" bordercolor="#dddddd" align="center" >

			<tr>
				<td id="idTable" align="center">아이디</td>
				<td><input type="text" id="id" size="10" maxlength="10">
					<div id="idDiv"></div></td>

			</tr>

			<tr>
				<td id="pwdTable" align="center">비밀<br>번호</td>
				<td><input type="password" id="pwd" size="10" maxlength="10">
					<div id="pwdDiv"></div></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
				<input type="button" value="로그인" id="loginBtn"> 
				<input type="button" value="회원가입" id="signInBtn">
				<!-- onclick:"location.href='/spring/member/writeForm'" -->
				</td>
			</tr>

		</table>
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script src="/spring/js/member.js"></script>

</body>
</html>