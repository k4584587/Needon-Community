<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<h1 align=center>게시판 목록</h1>
<table align=center border=1>
	<tr align=center>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>

<c:forEach items="${list }" var="list">
	<tr align=center>
		<td>${ list.no }</td>
		<td><a href="<c:url value="/board/view?no=${list.no }" />">${ list.subject }</a></td>
		<td> 작성자 </td>
		<td>${ list.read_count }</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ list.register_date }"/></td>
	</tr>
</c:forEach>
	<tr>
		<td colspan="5" align="right">
			<input type="button" value="글쓰기" onclick="location='<c:url  value="/board/write_from" />'">
		</td>
	</tr>
</table>