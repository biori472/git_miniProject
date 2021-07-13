$('#checkPostSearchBtn').click(function(){
	$.ajax({
		url: '/spring/member/checkPostSearch',
		type: 'post',
		data: $('#checkPostForm').serialize(),
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			
			$('#postTable tr:gt(2)').remove();//3번 줄 이하는 초기화  remove사용 
			
			$.each(data.list, function(index,items){

				var address = items.sido +' '
							+ items.sigungu +' '
							+ items.yubmyundong + ' '
							+ items.ri + ' '
							+ items.roadname + ' '
							+ items.buildingname ;
				
				address=address.replace(/null/g, '');
				//g = global 전체에서 다 바꿔라 null을 바꿔라 ! 원래는 null부분 undefined 였음. 
				//쩄든 address 에서 null이라는 값을 '' 로 바꿔라 라는 뜻. 
				
				
			//변수명 없이 동적 태그생성 $('<>').append($('<>'))
			
			/* a 태그 없을 때 .
			 * $('<tr/>').append($('<td/>',{
				align:'center',
				text : items.zipcode //부착한다,
			})).append($('<td/>',{
				colspan : 3,
				text : address,
			})).appendTo($('#checkPostTable'));*/
			
			
			$('<tr/>').append($('<td/>',{
				align:'center',
				text : items.zipcode //부착한다,
			})).append($('<td/>',{
				colspan : 3,
					}).append($('<a/>',{
						//href : '#',
						text : address,
						id : 'addressA'
					}))
				).appendTo($('#postTable'));
				
				
			});//each
			
			$('a').click(function(){
				//alert($(this).prop('tagName'));//alert으로 먼저 확인 
				//alert($(this).text());
				//alert($(this).parent().prev().text());//zipcode 확인하기 
				
				$('#zipcode',opener.document).val($(this).parent().prev().text());
				$('#addr1',opener.document).val($(this).text());
				$('#addr2',opener.document).focus();
				window.close();
			});
			
		},
		error: function(err){
			console.log(err);
		}
	});
	
	return false;
});