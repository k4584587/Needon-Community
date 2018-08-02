<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="<c:url value="/board/delete" />" method="post">
<input type="hidden" name="no" value="${param.no}" />
<input type="hidden" name="category" value="${param.category}" />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<h1 align=center>게시판 삭제</h1>
<table align=center border=1>
	<tr align=center>
		<td>${no }</td>
		<td>
			<input type="submit" value="삭제">
		</td>
	</tr>
</table>
</form>

