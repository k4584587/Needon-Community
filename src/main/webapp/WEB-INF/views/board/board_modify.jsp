<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="<c:url value="/board/modify" />" method="post">
<input type="hidden" name="no" value="${param.no}" />
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<h1 align=center>게시판 수정</h1>
<table align="center" border=1>
		<tr>
			<th>작성자</th>
			<td><input type="text"  name="writer" readOnly="readonly"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="${board.subject} "></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" >${board.content }</textarea></td>
		</tr>
		<tr>
			<td align=center colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>