<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<script>

$(function() {
	console.log("javascript load")
	$('#repInsert').click(function() {
			if (!frm.cm_body.value) {
				alert('댓글 입력후에 클릭하시오');
				frm.replytext.focus();
				return false;  
			}
			var frmData = $('form').serialize();
			console.log("frmData " +  frmData.toString());   
			
			var cm_nick = $("input[name= 'cm_nick' ]").val();
			var cm_body = $("textarea[name= 'cm_body' ]").val();
			var cm_regdate = $("input[name= 'cm_regdate' ]").val();
			 
			var insertHTML = "<tr>"+
				"<td>"+cm_nick+"</td>"+
				"<td>"+cm_body+"</td>"+
				"<td>"+cm_regdate+"</td>"+
				"<td>"+
				"</td>"+
			"</tr>";	
			   
			$.ajax({
		         type:"POST",
		         url:"<c:url value='/board/repInsert'/>",
		         data: frmData,   
		         success: function (result) {
		        	$("#comment_data > tbody > tr:last").after(insertHTML); 
		        	 alert(result);
		        	 frm.cm_body.value = '';
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
	<%--로그인 안할시에는 댓글등록 표시 안함--%>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user"/>
		<form name="frm" id="frm" align=center>
			<input type="hidden" name="cm_password" value="${user.password }">
			<input type="hidden" name="cm_nick" value="${board.wr_nick}"> <input
				type="hidden" name="parent" value="${param.no}">
			<input type="hidden" name="category" value="${param.category }">
			<input type="hidden" name="cm_regdate" value="${board.cm_regdate }"/>
			댓글 :
			<textarea rows="2" cols="50" name="cm_body"></textarea>
			<input type="button" value="확인" id="repInsert">
		</form>
		</sec:authorize>

<div class="container" align="center">
		<h2 class="text-primary">댓글</h2>
		<table id="comment_data" class="table table-bordered">
			<tr>
				<td>작성자</td>
				<td>내용</td>
				<td>수정일</td>
				<td></td>
			</tr>
			<c:forEach var="rb" items="${comment}">
				<tr id="comment_list">
					<td>${rb.cm_nick}</td>
					<td>${rb.cm_body}</td>
					<td>${rb.cm_regdate }</td>
					<td>
						<c:if test="${rb.cm_password eq board.wr_password }">
							<input type="button" value="수정" class="edit1" id="${rb.no}">
							<input type="button" value="삭제"	onclick="del(${rb.no},${rb.no})">
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	</div>