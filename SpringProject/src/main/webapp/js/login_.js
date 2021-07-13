function checkLogin(){
	
	document.getElementById("idDiv").innerText = "﻿";
	document.getElementById("pwdDiv").innerText = "";
	
	
	if (document.LoginForm.id.value == "") {
		document.getElementById("idDiv").innerText = "﻿이름을 입력하세요.";
		document.LoginForm.id.focus();
	} 
	else if (document.LoginForm.pwd.value == "") {
		document.getElementById("pwdDiv").innerText = "﻿아이디를  입력하세요.";
		document.LoginForm.password.focus();
	} else {
		document.LoginForm.submit();
	}
	
}