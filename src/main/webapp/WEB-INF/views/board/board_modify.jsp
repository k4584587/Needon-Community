<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<sec:authentication property="principal" var="user" />
<script type="text/javascript"
	src='<c:url value="/resources/smarteditor/js/service/HuskyEZCreator.js" />'
	charset="utf-8"></script>

<div style="margin-left: 10px;">
	<header
		style="background-color: white; border-bottom: 1px solid #b1b1b1;">
		<div class="p-3 board_head">
			<h3>${info.bo_title }</h3>
		</div>
	</header>
	<div style="margin-top: 10px;" class="alert alert-secondary"
		role="alert">
		<b>${info.bo_title } 글쓰기</b>
		<%-- ${ path+test.bo_subject } --%>
		<%-- ${test } --%>
	</div>
	<form id="board-write_form" action="<c:url value="/board/modify" />"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="wr_nick" value="${user.nick }" /> <input
			type="hidden" name="wr_password" value="${user.password }" /> <input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="category" value="${param.category }" /> <input
			type="hidden" name="page" value="${param.page}" />
		<input type="hidden" name="no" value=${param.no }/>
		<c:if test="${last.no eq null}">
				<input type="hidden" name="no" value="1" />
		</c:if>
		<div style="margin-top: 10px; margin-left: 100px;">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-auto">
					<b>옵션</b>
				</div>
				<div class="col-auto">
					<input type="checkbox"> 공지 <input type="checkbox">
					비밀글
				</div>
			</div>
			<div class="row">
				<div class="col-auto">
					<b>제목</b>
				</div>
				<div class="col-7">
					<input name="subject" type="text" class="form-control" value="${board.subject }">
				</div>
			</div>
		</div>
		<div style="margin-top: 10px; background-color: white;">
			<textarea name="content" id="content" rows="10"
				style="background-color: white; width: 100%; height: 412px;">${board.content }</textarea>
		</div>
		<button type="button" id="fedit" class="btn btn-danger" style="margin: 10px 0px;">파일 추가</button>
		<button type="button" id="fdelete" class="btn btn-secondary" style="margin-left: 10px">파일 삭제</button>	
			<c:forEach items="${test }" var="a">		
				<table class="table table-bordered" id="flist" style="margin: 10px 10px;">
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="file_name" id="file_name"></td>
					</tr>
					
						<!-- <b><div id="end" style="color: red; font-size: 15px;"></div></b> -->
				</table>
				<div id="fname" style="font-size: 15px; margin-left: 10px;"><a href="${path }${a.bo_encode}">${a.bo_subject }</a></div>
			 </c:forEach>
		<div style="margin-top: 10px;" align="center">
			<button id="btn-board_write" class="btn btn-success">수정하기</button>
			<button class="btn btn-warning">취소</button>
		</div>
	</form>
</div>

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
<script>
	$(function() {
		var num = 4;
		$("#fedit").click(function() {				
				console.log("추가"+num);
				if (num > 0) {
					num--;
					$("#flist:last").append("<tbody><tr><th>첨부파일</th><td><input type='file' name='file_name' id='file_name'></td></tr></tbody>");
				}else if (num == 0) {
					$("#end").html("최대 5개까지만 등록할 수 있습니다.");
					}
			})
		$("#fdelete").click(function() {				
			console.log("삭제"+num);
				if (num >= 0 && num < 3) {
					$("#flist > tbody:last > tr:last").remove();	
					num++;
					$("#end").hide();
				}
			})
	});
</script>
