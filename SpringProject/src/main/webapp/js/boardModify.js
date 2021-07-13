$(function(){
	$.ajax({
		type:'post',
		url:'/spring/board/getBoardView',//강사님은 getBoard
		data: 'seq='+$('input[name=seq]').val(),
		dataType: 'json',
		success: function(data){
			$('#subject').val(data.boardDTO.subject);
			$('#content').val(data.boardDTO.content);
		},error:function(err){
			console.log("에러발생"+err);
		}
	});
});
$('#boardModifyBtn').click(function(){
	
	$('#subjectDiv').empty();
	$('#contentDiv').empty();

	if($('#subject').val()==""){
		$('#subjectDiv').html("제목을 입력하세요");
	}else if($('#content').val()==""){
		$('#contentDiv').html("내용을 입력하세요");
	}
	else{
		$.ajax({
			type:'post',
			url:'/spring/board/boardModify',
			data: {
				'seq': $('#seq').val(),
				'subject': $('#subject').val(),
				'content': $('#content').val()
			},
			success:function(){
				alert("글 수정이 완료 되었습니다.");
				location.href="/spring/board/boardList";
			},error:function(){
				console.log("에러 발생"+err);
			}
		});
	}
});
