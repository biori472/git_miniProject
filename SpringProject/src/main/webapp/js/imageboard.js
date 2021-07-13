//imageboardWriteForm 
$('#imageboardWriteBtn').click(function(){
//1. submit으로 보내기
//$('#imageboardWriteForm').submit();
	
	var formData= new FormData($('#imageboardWriteForm')[0]);
	//forms 객체 생성. [0]번째 form 안에 있는 내용 넘기기
	
	$.ajax({
		url:'/spring/imageboard/imageboardWrite',
		type:'post',
		endtype:'multipart/form-data',
		processData:false,
		contentType:false,
		data:formData,
		success:function(data){
			alert("image 등록 완료");
			location.href='/spring/imageboard/imageboardList';
		},
		error:function(err){
			console.log("error발생"+err);
		}
	});

/*
 processData
 -기본값은 true
 -기본적으로 Query String 으로 변환해서 보내진다. ( '변수=값&변수=값' )
 -파일 전송시에는 반드시 false 로 해야한다. (formData를 문자열로 변환하지 않는다.)
 
 contentType
 -기본적으로 'application/x-www-form-urlencoded; charset=UTF-8'
 -파일 전송 시에는 'multipart/form-data' 로 전송이 될 수 있도록 false 로 설정한다.
 */	
	
	
//2. jQuery 이용 
/*	if($('#imageId').val()==""){
		$('#imageIdDiv').html("상품코드를 입력하세요.")
	}else if($('#imageName').val()==""){
		$('#imageNameDiv').html("상품명을 입력하세요.")
	}else if($('#imagePrice').val()==""){
		$('#imagePriceDiv').html("상품 가격을 입력하세요.")
	}else if($('#imageQty').val()==""){
		$('#imageQtyDiv').html("상품 수량을 입력하세요.")
	}else if($('#imageContent').val()==""){
		$('#imageContentDiv').html("상품 내용을 입력하세요.")
	}else {
		$.ajax({
			url:'/spring/imageboard/imageboardWrite',
			type:'post',
			data:$('#imageboardWriteForm').serialize(),
			success:function(){
				alert("이미지 리스트 등록 완료");
			},error:function(err){
				alert("이미지 등록 실패");
			}
		});}*/	
});



