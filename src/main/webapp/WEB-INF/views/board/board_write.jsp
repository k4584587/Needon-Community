<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="user" />
<script type="text/javascript"
	src='<c:url value="/resources/smarteditor/js/service/HuskyEZCreator.js" />'
	charset="utf-8"></script>

<script>
	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator
				.createInIFrame({
					oAppRef : editor_object,
					elPlaceHolder : "content",
					sSkinURI : "<c:url value='/resources/smarteditor/SmartEditor2Skin.html'/>",
					htParams : {
						// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseToolbar : true,
						// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
						bUseVerticalResizer : true,
						// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
						bUseModeChanger : true,
					}
				});

		//전송버튼 클릭이벤트
		$("form").on("submit", function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

		});
	});
</script>

<form action="<c:url value="/board/write" />" method="post">

	<input type="hidden" name="wr_nick" value="${user.nick }" /> <input
		type="hidden" name="wr_password" value="${user.password }" /> <input
		type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="hidden" name="category" value="${param.category }" /> <input
		type="hidden" name="page" value="${param.page}" />
	<table align="center" border=1 style="width: 766px; height: 412px;">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" id="content" rows="10" cols="100"
					style="width: 766px; height: 412px;"></textarea></td>
		</tr>
		<tr>
			<td align=center colspan="2"><input type="submit" value="등록">
				<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>