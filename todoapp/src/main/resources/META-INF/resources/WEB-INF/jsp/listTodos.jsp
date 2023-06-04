
<%@include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
<h1>Todo-List</h1>
<table class="table">
	<thead>
		<tr>
			<th>설명</th>
			<th>목표일</th>
			<th>처리결과</th>
			<th></th>
	        <th></th>		
	        <th></th>	
	        		   	
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${todos }" var="todo">
			<tr>
				<td>${todo.description }</td>
				<td>${todo.targetDate }</td>
				<c:choose>
				<c:when test="${!todo.done }">
					<td>미완료</td>
				</c:when>
				<c:otherwise>
					<td>완료</td>
				</c:otherwise>	
				</c:choose>
				<td><a href="delete-todo?id=${todo.id }" class="btn btn-warning">삭제</a></td>
				<td><a href="update-todo?id=${todo.id }" class="btn btn-success">수정</a></td>
				
			</tr>
		</c:forEach>
	</tbody>
</table>
<a href="add-todo" class="btn btn-primary">Todo-List 더하기</a>
</div>
<%@ include file="common/footer.jspf" %>