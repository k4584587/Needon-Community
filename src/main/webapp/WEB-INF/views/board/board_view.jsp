<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 align=center>게시판 조회</h1>
<table align="center" border=1>
	<tr>
		<th>제목</th>
		<td>${board.subject }</td>
		<th>작성자</th>
		<td>작성자</td>
	</tr>
	<tr>
		<th>IP</th>
		<td>${board.ip }</td>
		<th>첨부파일</th>
		<td>${board.file }</td>
	</tr>
	<tr>
		<th colspan="4">내용</th>
	</tr>
	<tr>
		<td colspan="4"><pre>${board.content }</pre></td>
	</tr>
	<tr>
		<td colspan="4" align=center><input type="button" value="수정"
			onclick="location='<c:url  value="/board/modify_form?page=${param.page }&no=${board.no}&category=${param.category }" />'">
			&nbsp;&nbsp; <input type="button" value="삭제"
			onclick="location='<c:url  value="/board/delete_form?page=${param.page }&no=${board.no}&category=${param.category }" />'" />
			&nbsp;&nbsp; <input type="button" value="목록"
			onclick="location='<c:url  value="/board/${param.category }/list?page=${param.page} "/>'" />
		</td>
	</tr>

</table>

<p>
<div id="slist"></div>
<p>
<form name="frm" id="frm" align=center>
	<input type="hidden" name="replyer" value="${board.wr_nick}"> <input
		type="hidden" name="no" value="${board.no}"> 
		댓글 :
	<textarea rows="2" cols="50" name="replytext"></textarea>
	<input type="button" value="확인" id="repInsert">
</form>