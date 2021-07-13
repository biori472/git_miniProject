$(function(){
	$.ajax({
		url:'/spring/imageboard/getImageboardList',
		type:'post',
		dataType:'json',
		data:'pg='+$('#pg').val(),
		//data:$('#imageboardListForm').serialize(),
		success:function(data){
			alert(JSON.stringify(data));
	
			//list가 빈값인지 확인한 후 
			if(data=="list[]"){
				alert("목록이 비어있습니다. ")
			}
			else {
			//list each문 돌려서 append 하기.
			var table; 
			$.each(data.list,function(index,items){
				
				
			});//each
				
			}
			
			//로그인 여부 체크하고, 
			
			//페이징 처리 하기 
			
		},error:function(err){
			console.log("에러발생"+err);
		}
		
		
		
	});
	
});
