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
		<td colspan="4" align=center>
			<input type="button" value="수정" onclick="location='board_modify?no=${board.no}&page=${page}'" /> &nbsp;&nbsp;
			<input type="button" value="삭제" onclick="location='board_delete?no=${board.no}&page=${page}'" /> &nbsp;&nbsp;
			<input type="button" value="목록" onclick="location='board_list?page=${page}'" />
		</td>
	</tr>
	
</table>