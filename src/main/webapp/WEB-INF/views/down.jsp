<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	out.clear();
	out=pageContext.pushBody(); 
%>

<script>
	location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>