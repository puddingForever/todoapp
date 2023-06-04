
<%@include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container">
<h1>Todo-list 추가하기</h1>
<form:form method="post" modelAttribute="todo">
	<fieldset class="mb-3">
		<form:label path="description">설명</form:label>
		<form:input type="text" path="description" required="required"/>
		<form:errors path="description" cssClass="text-warning"/>
	 </fieldset>
	 <fieldset class="mb-3">
		<form:label path="targetDate">목표일</form:label>
		<form:input type="text" path="targetDate" required="required"/>
		<form:errors path="targetDate" cssClass="text-warning"/>
	 </fieldset>
	  <fieldset class="mb-3">
		<form:label path="targetDate">완료</form:label>
		<form:select path="done" required="required">
		    <option value="true">완료</option>
		    <option value="false">미완료</option>
		</form:select>
		<form:errors path="done" cssClass="text-warning" />
	 </fieldset>
 <form:input type="hidden" path="id"/>
 <form:input type="hidden" path="done"/>
 <input type="submit" class="btn btn-success"/>
</form:form>
</div>

<%@ include file="common/footer.jspf" %>
	
<script type="text/javascript">
$('#targetDate').datepicker({
    format: 'yyyy-mm-dd'
});	
</script>

