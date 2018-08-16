<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<sec:authentication property="principal" var="user"/>

<script>
$(function() {
	console.log("javascript load")
	$('#repInsert').click(function() {
			if (!frm.replytext.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.replytext.focus();
				return false;
			}
			var frmData = $('form').serialize();
			$.ajax({
		         type:"POST",
		         /*url:"./jsp/member/member_idcheck.jsp",*/
		         url:"<c:url value='/board/view${pageMaker.uri(pageMaker.cri.page) }&no=${list.no }&category=${category }' />",     
		         data: frmData,   
		         success: function (data) { 
		        	 alert("test");
		         }
	});
});  
});  
</script>
<h1 align=center>게시판 조회</h1>
<table align="center" border=1>
	<tr>
		<th>제목</th>
		<td>${board.subject }</td>
		<th>작성자</th>
		<td>${board.wr_nick }</td>
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
		<td colspan="4"><div align="left">${board.content }</div></td>
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
	<input type="hidden" name="cm_password" value="${user.password }">
	<input type="hidden" name="replyer" value="${board.wr_nick}"> <input
		type="hidden" name="no" value="${board.no}"> 
		댓글 :
	<textarea rows="2" cols="50" name="replytext"></textarea>
	<input type="button" value="확인" id="repInsert">	
</form>

<div class="container" align="center">
		<h2 class="text-primary">댓글</h2>
		<table class="table table-bordered">
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>수정일</td>
				<td></td>
			</tr>
			<c:forEach var="rb" items="${comment}">
				<tr>
					<td>${rb.cm_nick}</td>
					<td id="td_${rb.cm_no}">${rb.cm_body}</td>
					<td>${rb.cm_regdate }</td>
					<td id="btn_${rb.cm_no}">
						<c:if test="${rb.cm_password eq board.wr_password }">
							<input type="button" value="수정" class="edit1" id="${rb.cm_no}">
							<input type="button" value="삭제"	onclick="del(${rb.cm_no},${rb.cm_no})">
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>