//boardList + boardPaging

$(document).ready(function(){
	$('#table').hide();
	$.ajax({
		url : '/spring/board/getBoardList',
		type : 'post',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success:function(data){
			console.log(JSON.stringify(data));//JSON형식 그대로 보여줭
			  var table;
			  $.each(data.list, function(index, items){
					
					$('<tr/>').append($('<td/>',{
						align:'center',
						text :items.seq
					
					})).append($('<td/>',{
//						align:'center'
						}).append($('<a/>',{//td의 자식으로 들어감.
							href : '#',
							text : items.subject,
							id : 'subjectA',
							class : 'subject_'+items.seq
						}))
					).append($('<td/>',{
						align:'center',
						text : items.id
						
					})).append($('<td/>',{
						align:'center',
						text : items.logtime
						
					})).append($('<td/>',{
						align:'center',
						text : items.hit	
					
					})
					).appendTo($('#boardListTable'));
					
					for(var i=1; i<=items.lev; i++){
						$('.subject_'+items.seq).before('&emsp;')
					}
					//답글
					if(items.pseq!=0){//원글이 0이 아니어야,이미지...
						$('.subject_'+items.seq).before($('<img>',{
							src:'../image/reply.gif'
						}));				
					}//if
					
/*					//로그인 여부 -1
					$('.subject_'+items.seq).click(function(){
						//session값 확인 (controller가 준다.)
						if(data.memId==null){ 
							alert("먼저 로그인 하세요");
						}
						else {
							//alert(data.memId);
							location.href="/spring/board/boardView?seq="+items.seq+"&pg="+$('#pg').val();
						}
					});*/
					
			  });//each (each문 안에서는 click, 밖에서는 on을 쓴다. )
			  
			//로그인 여부-2
			$(document).on('click','#subjectA',function(){
				//==$('#boardListTable').on('click', '#subjectA', function(){ 이렇게 써도되고,document 로 써도 된다.
				//alert($(this).parent().prev().prop('tagName'));
				if(data.memId==null){ 
					alert("먼저 로그인 하세요");
				}
				else {	//this--> 
					var seq=$(this).parent().prev().text();//a 태그
					location.href="/spring/board/boardView?seq="+seq+"&pg="+$('#pg').val();
				}
			});//on이벤트
			
			/* 페이징 처리 하기 */
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
			//alert(data.boardPaging.pagingHTML);
			
		},error:function(err){
			console("에러발생"+err);
		}
	});
});
$('#boardSearchBtn').click(function(){
	
	if($('#keyword').val()==''){
		alert('검색어를 입력하세요.')
	}else{
			
			$.ajax({
				
				url:'/spring/board/boardSearch',
				type:'post',
				dataType:'json',
				data: {
					'searchOption':$('#searchOption').val(),
					'keyword':$('#keyword').val(),
					'pg' : $('#hiddenPg').val()	//$('#searchForm').serialize() 로 바꿔도 가능. 
				},
				success:function(data){
					//alert(JSON.stringify(data.list));//JSON형식 그대로 보여줭
					//alert("왔어?");
				
					if(JSON.stringify(data.list)=='[]'){ 
			    		 alert("찾는 내용이 없습니다.");
			    		 location.href="/spring/board/boardList?pg=1";
			    	}
					
					else{
					var table;
					
					$('#boardListTable tr:gt(0)').remove();
					
					$.each(data.list, function(index, items){
							
							$('<tr/>').append($('<td/>',{
								align:'center',
								text :items.seq
							})).append($('<td/>',{
		//						align:'center'
								}).append($('<a/>',{//td의 자식으로 들어감.
									href : '#',
									text : items.subject,
									id : 'subjectA',
									class : 'subject_'+items.seq
								}))
							).append($('<td/>',{
								align:'center',
								text : items.id
								
							})).append($('<td/>',{
								align:'center',
								text : items.logtime
								
							})).append($('<td/>',{
								align:'center',
								text : items.hit	
							})
							).appendTo($('#boardListTable'));
							
							for(var i=1; i<=items.lev; i++){
								$('.subject_'+items.seq).before('&emsp;')
							}
							//답글
							if(items.pseq!=0){//원글이 0이 아니어야,이미지...
								$('.subject_'+items.seq).before($('<img>',{
									src:'../image/reply.gif'
								}));				
							}//if
							
							//로그인 여부 -1(boardView 로 들어갈 때) 
							$('.subject_'+items.seq).click(function(){
								//session값 확인 (controller가 준다.)
								if(data.memId==null){ 
									alert("먼저 로그인 하세요");
								}
								else {
									//alert(data.memId);
									location.href="/spring/board/boardView?seq="+items.seq+"&pg="+$('#pg').val();
								}
							});//로그인여부 
							
					  });//each (each문 안에서는 click, 밖에서는 on을 쓴다. )
					
					
					} //큰 else
					/* 페이징 처리 하기 */
					$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				},
				error:function(err){
					console.log(err);
				}
			});//ajax
	}//else

	//return false;
	
});
		























