//boardView
$(document).ready(function(){
	$.ajax({
		
		url:'/spring/board/getBoardView',
		type:'post',
		data : 'seq='+$('#seq').val(),		
		dataType : 'json',
		success:function(data){
			console.log(data);
			
			$('#subjectSpan').text('제목: ' + data.boardDTO.subject);
			$('#seqSpan').text(data.boardDTO.seq);
			$('#idSpan').text(data.boardDTO.id);
			$('#hitSpan').text(data.boardDTO.hit);
			$('#contentSpan').text(data.boardDTO.content);
			
			if(data.memId == data.boardDTO.id){
				$('#boardViewSpan').show();
			}else{
				$('#boardViewSpan').hide();
			}
		},
		error:function(err){
			console.log("err발생"+err);
		}
				
	});//ajax	
	
});


$('#deleteBtn').click(function(){
	$.ajax({
		url : '/spring/board/boardDelete',
		type:'post',
		data : 'seq='+$('#seq').val(),		
		success:function(){
			alert("삭제를 완료 하였습니다.");
			location.href="/spring/board/boardList?pg="+$('#pg').val();;
		},
		error:function(){
			alert("error발생"+err);
		}
	});	
});//deleteBtn
