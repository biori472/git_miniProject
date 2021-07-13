function checkWrite() {

	document.getElementById("nameDiv").innerText = "﻿";
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText = "﻿";
	document.getElementById("pwd2Div").innerText = "";

	if (document.writeForm.name.value == "") {
		document.getElementById("nameDiv").innerText = "﻿이름을 입력하세요.";
		document.writeForm.name.focus();
	} 
	else if (document.writeForm.id.value == "") {
		document.getElementById("idDiv").innerText = "﻿아이디를 입력하세요.";
		document.writeForm.id.focus();
	}
	else if (document.writeForm.checkID.value == "") {
		document.getElementById("idDiv").innerText = "중복체크 하세요.";
		document.writeForm.id.focus();		
	}
	else if (document.writeForm.checkID.value != document.writeForm.id.value) {
		document.getElementById("idDiv").innerText = "중복체크를 다시 하세요.";
		document.writeForm.id.focus();
	}
	else if (document.writeForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerText = "﻿비밀번호를 입력하세요.";
		document.writeForm.pwd.focus();
	}
	else if (document.writeForm.pwdRe.value != document.writeForm.pwd.value) {
		document.getElementById("pwd2Div").innerText = "﻿비밀번호가 일치하지 않습니다.";
		document.writeForm.pwdRe.focus();
	
	}
	else if (document.writeForm.pwdRe.value == document.writeForm.id.value) {
		document.getElementById("pwd2Div").innerText = "아이디와 비밀번호가 일치할 수 없습니다.";
		document.writeForm.id.focus();
	}
	else {
		document.writeForm.submit();
	}

}

function checkLogin() {

	document.getElementById("idDiv").innerText = "﻿";
	document.getElementById("pwdDiv").innerText = "";

	if (document.LoginForm.id.value == "") {
		document.getElementById("idDiv").innerHTML = "﻿<font color='red' size='2'><strong>이름을 입력하세요.</strong></font>";
		document.LoginForm.id.focus();
	}
	else if (document.LoginForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerHTML = "<font color='red' size='2'><strong>﻿아이디를 입력하세요.</strong></font>";
		document.LoginForm.pwd.focus();
	} else {
		document.LoginForm.submit();
	}

}

function checkPost() {
	window.open("/miniProject/member/checkPost.do", "checkPost", "width=500 height=500 left=500 top=700 scrollbars=yes");
}



function checkId() {
	document.getElementById("idDiv").innerText = "﻿";
	var id = document.writeForm.id.value;
	
	if (id == "") {
		//alert("먼저 아이디를 입력하세요.");	
		document.getElementById("idDiv").innerText = "﻿먼저 아이디를  입력하세요.";
	} else
		window.open("/miniProject/member/checkId.do?id="+id, "checkId", "width=400 height=150 left = 500 top =200");
}

function checkModifyData() {

	document.getElementById("nameDiv").innerText = "﻿";
	document.getElementById("pwdDiv").innerText = "";
	document.getElementById("pwdDiv2").innerText = "";

	if (document.modifyForm.name.value == "") {
		document.getElementById("nameDiv").innerText = "﻿이름을 입력하세요.";
		document.modifyForm.name.focus();
	}
	else if (document.modifyForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerText = "﻿비밀번호를 입력하세요.";
		document.modifyForm.pwd.focus();
	}
	else if (document.modifyForm.pwdRe.value != document.modifyForm.pwd.value) {
		document.getElementById("pwdDiv2").innerText = "﻿비밀번호를 입력하세요.";
		document.modifyForm.pwd.focus();
	}
	else if (document.modifyForm.pwdRe.value == document.modifyForm.id.value) {
		document.getElementById("pwdDiv2").innerText = "﻿아이디와 비밀번호는 같을 수 없습니다.";
		document.modifyForm.pwd.focus();
	}
	else {
		document.modifyForm.submit();

	}

}

