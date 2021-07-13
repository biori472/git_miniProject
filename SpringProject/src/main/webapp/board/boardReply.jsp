<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <h3>작성하신 글을 저장하였습니다.</h3>
	<script type="text/javascript">
	window.onload=function(){
	alert("작성하신 글을 저장하였습니다.");	
	location.href ="boardList.do?pg=${pg}";
}	
	</script>
	