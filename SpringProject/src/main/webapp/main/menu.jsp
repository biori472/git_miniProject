<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!-- nav.jsp 와 동일  -->

<div class="menu1" align="center"><br>
<c:if test="${sessionScope.memId == null}">
	<jsp:include page="../member/loginForm.jsp" />
</c:if>

<c:if test="${sessionScope.memId != null}">
	<img src="/spring/image/woolmugi.png" width="120" height="120" alt="울무기" style="cursor:pointer;"><br>
	<jsp:include page="../member/loginOk.jsp"/>
</c:if>
<%-- 
<c:if test="${sessionScope.memId == null && loginResult=='fail'}"><br>
	<jsp:include page="../member/loginFail.jsp"/>
</c:if> --%>
</div>
