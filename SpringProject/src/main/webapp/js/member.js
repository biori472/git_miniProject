//로그인버튼 누를때. 
$('#loginBtn').click(function(){
	
	if($('#id').val()==""){
		$('#idDiv').html("아이디를 입력하세요.");
		$('#idDiv').css("font-size", "15px");
		$('#idDiv').css("color", "red");
		$('#idDiv').css("font-weight", "bold");
	}
	else if($('#pwd').val()==""){
		$('#pwdDiv').html("비밀번호를 입력하세요");
		$('#pwdDiv').css("font-size", "15px");
		$('#pwdDiv').css("color", "red");
		$('#pwdDiv').css("font-weight", "bold");
	}
	else {
		$.ajax({
			type: "post",
			url : "/spring/member/login",
			data : {
				'id' : $('#id').val(),
				'pwd' : $('#pwd').val()				
			},
			dataType : 'text',
			success:function(data){
				if(data=='fail'){
					alert('일치하는 계정이 없습니다.')
				}else{ //success , session값 같이 들어온다. 
					alert('로그인을 환영합니다.')
					//location.href="/spring/member/loginOk.jsp";
					location.href="/spring/index.jsp";
				}
			},error:function(err){
				console("에러발생"+err)
			}
		});
	}
});
//회원가입버튼 누를 때.
$('#signInBtn').click(function(){
	location.href="/spring/member/writeForm";
});


$('#checkPost').click(function(){
	window.open("/spring/member/checkPost","checkPost", 
	"width=500 height=500 left=800 top=200 scrollbars=yes");
});

//회원가입-중복아이디 버튼으로도 가능. 그리고 id값 아니고 상속관계로도 설정 가능,
$('#writeFormId').focusout(function(){
	
	if($('#writeFormId').val()==""){
		$('#writeFormIdDiv').html("아이디를 입력하세요.");
	}
	else {
		$.ajax({
			type:"post", 
			url:"/spring/member/checkId",
			data : {'id' : $('#writeFormId').val() },
			dataType : 'text',
			success:function(data){
				data=data.trim();
				if(data=='non_exist'){
				 
					$('#writeFormIdDiv').html("사용 가능한 아이디 입니다.");
	                $('#writeFormIdDiv').css('color', 'RebeccaPurple');
	                $('#writeFormIdDiv').css('font-size', '8pt');
	                $('#writeFormIdDiv').css('font-weight', 'bold');
	                
		            $('#check').val($('#writeFormId').val());

				}else{
					 $('#writeFormIdDiv').html("이미 등록된 아이디 입니다.");
		             $('#writeFormIdDiv').css('color', 'tomato');
		             $('#writeFormIdDiv').css('font-size', '8pt');
		             $('#writeFormIdDiv').css('font-weight', 'bold');
				}		
				
			},error:function(err) {
				console.log("에러발생"+err);
				alert("error");
			}			
		});
	}
});

/*$('.focusIn').focusout(function() {
	
	$('#writeFormNameDiv').empty();
	$('#writeFormIdDiv').empty();
	$('#writeFormPwdDiv').empty();		
	$('#writeFormPwdReDiv').empty();

	if($(this).val()==''){
		
		if($('#writeFormName').val()==""){
			$('#writeFormNameDiv').html("이름을 입력하세요");
			$('#writeFormNameDiv').css("font-size", "15px");
			$('#writeFormNameDiv').css("color", "red");
			$('#writeFormNameDiv').css("font-weight", "bold");
		}else if($('#writeFormId').val()==""){
			$('#writeFormIdDiv').html("아이디를 입력하세요");
			$('#writeFormIdDiv').css("font-size", "15px");
			$('#writeFormIdDiv').css("color", "red");
			$('#writeFormIdDiv').css("font-weight", "bold");
		}else if($('#writeFormPwd').val()==""){
			$('#writeFormPwdDiv').html("비밀번호를 입력하세요");
			$('#writeFormPwdDiv').css("font-size", "15px");
			$('#writeFormPwdDiv').css("color", "red");
			$('#writeFormPwdDiv').css("font-weight", "bold");
		}else if($('#writeFormPwdRe').val()==""){
			$('#writeFormPwdReDiv').html("비밀번호를 재입력하세요");
			$('#writeFormPwdReDiv').css("font-size", "15px");
			$('#writeFormPwdReDiv').css("color", "red");
			$('#writeFormPwdReDiv').css("font-weight", "bold");
		}else if($('.focusIn').val() == ''){
			alert("빈칸을 채워 주세요.")
		}
	}
	
});*/
//회원가입-유효성
$('#writeFormSignIn').click(function(){
		
		$('#writeFormNameDiv').empty();
		$('#writeFormIdDiv').empty();
		$('#writeFormPwdDiv').empty();		
		$('#writeFormPwdReDiv').empty();
	
		if($('#writeFormName').val()==""){
			$('#writeFormNameDiv').html("이름을 입력하세요");
			$('#writeFormNameDiv').css("font-size", "15px");
			$('#writeFormNameDiv').css("color", "red");
			$('#writeFormNameDiv').css("font-weight", "bold");
		}
		else if($('#writeFormId').val()==""){
			$('#writeFormIdDiv').html("아이디를 입력하세요");
			$('#writeFormIdDiv').css("font-size", "15px");
			$('#writeFormIdDiv').css("color", "red");
			$('#writeFormIdDiv').css("font-weight", "bold");
		}
		else if($('#writeFormPwd').val()==""){
			$('#writeFormPwdDiv').html("비밀번호를 입력하세요");
			$('#writeFormPwdDiv').css("font-size", "15px");
			$('#writeFormPwdDiv').css("color", "red");
			$('#writeFormPwdDiv').css("font-weight", "bold");
		}
		else if($('#writeFormPwdRe').val()==""){
			$('#writeFormPwdReDiv').html("비밀번호를 재입력하세요");
			$('#writeFormPwdReDiv').css("font-size", "15px");
			$('#writeFormPwdReDiv').css("color", "red");
			$('#writeFormPwdReDiv').css("font-weight", "bold");
		}
		else if($('#check').val() != $('#writeFormId').val()){
		      $('#writeFormIdDiv').text('중복된 아이디 입니다.');
		}
		else{
			$.ajax({
				url : "/spring/member/write",
				type : 'post',
				data : $('#writeForm').serialize(),
				success: function(){
					 alert('회원 가입을 축하합니다.~:D');
					 location.href="/spring/index.jsp";
				},
				error: function(err){
					console.log(err);
					alert('회원 가입 실패!');
				}
			});
		}	
	});//회원가입유효성



//회원정보수정버튼 누를 때.
$('#login_ModifyBtn').click(function(){
	location.href="/spring/member/modifyForm";
});

//회원정보수정
$('#modifyBtn').click(function(){
	
	$('#nameDiv').empty();
	$('#pwdDiv').empty();		
	$('#pwdDiv2').empty();

	if($('#name').val()==""){
		$('#nameDiv').html("이름을 입력하세요");
		$('#nameDiv').css("font-size", "15px");
		$('#nameDiv').css("color", "red");
		$('#nameDiv').css("font-weight", "bold");
	}
	else if($('#pwd').val()==""){
		$('#pwdDiv').html("비밀번호를 입력하세요");
		$('#pwdDiv').css("font-size", "15px");
		$('#pwdDiv').css("color", "red");
		$('#pwdDiv').css("font-weight", "bold");
	}
	else if($('#pwdRe').val()==""){
		$('#pwdDiv2').html("비밀번호를 재입력하세요");
		$('#pwdDiv2').css("font-size", "15px");
		$('#pwdDiv2').css("color", "red");
		$('#pwdDiv2').css("font-weight", "bold");
	}else {
		//form 액션으로 넘어갈 수 있또록
		$('form[name=modifyForm]').submit();
	}
	
});


