<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Oswald&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<title>imageboardList</title>
<style type="text/css">
body, input{
font-family: 'Noto Serif KR', serif;
}
h2{
float:center;
}
.img{
transform:scale(1.0);
transition: transform .5s; 
cursor: pointer;
}
.img:hover{
transform:scale(1.5);
transition: transform .5s;
}
#currentPaging {
	color: red;
	text-decoration: underline; /**/
	font: bold 18px "Nanum Gothic";
	cursor : pointer;
	padding : 5px 2px; 
	margin : 10px;
	
}

#paging {
	color: black;
	text-decoration: none;
	align-items: center;
	font: bold 18px "Nanum Gothic";
	cursor : pointer;
	padding : 5px 2px;
	margin : 10px;
	
}
</style>

</head>
<body>

<form name="imageboardListForm" id="imageboardListForm" method="get" action="imageboardDelete">

	<input type="hidden" id="pg" name="pg" value="${pg}">	<!-- controller에서 넘어온 pg -->
	
	<h2 align="center">Image list
	<i class="fas fa-shopping-cart"></i>
	</h2>
	<hr>
	
	<br>
		<table border="1" id="imageboardListTable" cellpadding="5" width="750" bordercolor="" align="center" frame="hsides" rules="rows">
					
				<tr class="title">
							<th><input type="checkbox" id="all" name="all" value="all"> 번호</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>단가</th>
							<th>개수</th>
							<th>합계</th>
				</tr>
			</table>
		<br>
		<table align="center">
				<tr>
					<td colspan="6" align="center">
					<input type="button" value="메인으로" onclick="location.href='../index.jsp'">
					<input type="button" value="등록화면" onclick="location.href=imageboardWriteForm">
					
					<input type="submit" value="선택삭제" id="choiceDeleteBtn">
					</td>
				</tr>
		</table>
				
	<div id="imageboardPagingDiv" align="center">
	<div style="width: 750px; text-align: center;"></div>
	</div>

</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script>

$(function(){
	$.ajax({
		url:'/spring/imageboard/getImageboardList',
		type:'post',
		dataType:'json',
		data:'pg=${pg}', 
		//data:$('#imageboardListForm').serialize(),
		success:function(data){
			//alert(JSON.stringify(data));
	
			//list가 빈값인지 확인한 후 
			if(data=="list[]"){
				alert("목록이 비어있습니다. ")
			}
			else {
			//list each문 돌려서 append 하기.
			var table; 
			$.each(data.list,function(index,items){ 
				
				$('<tr/>').append($('<td/>',{
					align:'center',
					text:items.seq
					}).prepend($('<input>',{
						type:'checkbox',
						name:'check',
						value:items.seq
					}))
					).append($('<td/>',{
						align:'center',
						}).append($('<img/>',{
						src:'/spring/storage/'+items.image1,
						style:'width:70px; height:70px; cursor:pointer;',
						class:"img_"+items.seq
					}))
				).append($('<td/>',{
					align:'center',
					text:items.imageName
				})).append($('<td/>',{
					align:'center',
					text:items.imagePrice.toLocaleString()
				})).append($('<td/>',{
					align:'center',
					text:items.imageQty
				})).append($('<td/>',{
					align:'center',
					text:(items.imagePrice*items.imageQty).toLocaleString()
				})).appendTo($('#imageboardListTable'));

				$('.img_'+items.seq).click(function(){//seq, pg 
					location.href='/spring/imageboard/imageboardView?seq='+items.seq+'&pg='+$('#pg').val();
				});
			});//each
				
			}
			//로그인 여부 체크하고, 
			
			//페이징 처리 하기 
			$('#imageboardPagingDiv').html(data.imageboardPaging.pagingHTML)
		},error:function(err){
			console.log("에러발생"+err);
		}	
	});
});
</script>


<script type="text/javascript">
function imageboardPaging(pg){
	//alert("imageboardList의 pg= " +pg+"||")
	location.href="imageboardList?pg="+pg;
}
//전체 선택 또는 해제
$('#all').click(function(){
	//alter($('#all').attr('checked'));//checked 속성이 없어서 undefind으로 나온다.
	alert($('#all').prop('checked'));//attr이 아니라 값으로 가져와야한다. 

	if($('#all').prop('checked')){
		$('input[name=check]').prop('checked',true);
	}else {
		$('input[name=check]').prop('checked',false);
	}
});

//선택삭제
$('#choiceDeleteBtn').click(function(){
	var count = $('input[name=check]:checked').length;
	
	alert($('input[name=check]:checked').val());
	
	if(count==0){
		alert("삭제할 항목을 선택 하세요");
	}else {
		if(confirm("정말로 삭제 하시겠습니까?")){
			//document.imageboardListForm.submit();
			$('#imageboardListForm').submit();
		}else{
		}
	}
});

</script>



</body>
</html>