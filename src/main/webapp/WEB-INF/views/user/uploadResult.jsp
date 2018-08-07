<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${result == 1}">
	<script>
		alert("파일은 100kb까지 업로드 가능.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 2}">
	<script>
		alert("첨부파일은 jpg,gif,png만 업로드 가능");
		history.go(-1);
	</script>
</c:if>
