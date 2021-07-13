$('#boardWriteBtn').click(function(){
	
	$('#subjectDiv').empty();
	$('#contentDiv').empty();

	
	   if($('#subject').val() == ''){
		      $('#subjectDiv').html("제목 입력");
		      $('#subjectDiv').css('color', 'red');
		      $('#subjectDiv').css('font-size', '8pt');
		      $('#subjectDiv').css('font-weight', 'bold');
	   }else if($('#content').val() == ''){
		      $('#contentDiv').html("내용 입력");
		      $('#contentDiv').css('color', 'red');
		      $('#contentDiv').css('font-size', '8pt');
		      $('#contentDiv').css('font-weight', 'bold');

	   }else{
		      $.ajax({
		          url: '/spring/board/boardWrite',
		          type: 'post',
		          data: 
		 			{
		 				'subject' : $('#subject').val(),
		              	'content' : $('#content').val()
		 			},
		          success: function(){
		            alert("글쓰기 완료");
		 			location.href ='/spring/board/boardList';
		            //location.href ='/spring/board/boardListForm';
		          },
		          error: function(err){
		             console.log(err);
		          }
		       });
		   }
	 });

//Reply 답글쓰기
$('#boardReplyBtn').click(function(){
	
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	   if($('#subject').val() ==''){
		      $('#subjectDiv').html("제목 입력");
		      $('#subjectDiv').css('color', 'red');
		      $('#subjectDiv').css('font-size', '8pt');
		      $('#subjectDiv').css('font-weight', 'bold');
	   }else if($('#content').val() == ''){
		      $('#contentDiv').html("내용 입력");
		      $('#contentDiv').css('color', 'red');
		      $('#contentDiv').css('font-size', '8pt');
		      $('#contentDiv').css('font-weight', 'bold');
	   }else{
		      $.ajax({
		          url: '/spring/board/boardReply',
		          type: 'post',
		          data: 
		 			{
		        	  	'pseq' : $('input[name=pseq]').val(),//원글번호
		        	  //	'pg':$('input[name=pg]').val(),//원글있는 페이지 번호
		 				'subject' : $('#subject').val(),
		              	'content' : $('#content').val()
		 			},
		          success: function(){
		            alert("답글쓰기 완료");
		 			location.href ='/spring/board/boardList?pg='+$('input[name=pg]').val();
		            //location.href ='/spring/board/boardListForm';
		          },
		          error: function(err){
		             console.log(err);
		          }
		       });
		   }
	   
});
