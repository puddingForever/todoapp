<%@include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
		<h1>환영합니다 ${name }님 ! </h1>
	    ${name }님의 <a href="list-todos">todo-list&nbsp;</a>확인하기
	</div>			
<%@ include file="common/footer.jspf" %>