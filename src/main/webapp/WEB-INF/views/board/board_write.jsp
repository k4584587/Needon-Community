<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="user" />
<script type="text/javascript"
	src='<c:url value="/resources/smarteditor/js/service/HuskyEZCreator.js" />'
	charset="utf-8"></script>


<div style="margin-left: 10px;">
	<header style="background-color: white;border-bottom: 1px solid #b1b1b1;">
		<div class="p-3 board_head">
			<h3>공지사항</h3>
		</div>
	</header>
	<div style="margin-top: 10px;" class="alert alert-secondary" role="alert">
		<b>공지사항 글쓰기</b>
	</div>
	<form id="board-write_form" action="<c:url value="/board/write" />" method="post" enctype="multipart/form-data">
		<input type="hidden" name="wr_nick" value="${user.nick }" />
		<input type="hidden" name="wr_password" value="${user.password }" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="category" value="${param.category }" />
		<input type="hidden" name="page" value="${param.page}" />
		<div style="margin-top: 10px;margin-left: 100px;">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-auto">
					<b>옵션</b>
				</div>
				<div class="col-auto">
					<input type="checkbox"> 공지
					<input type="checkbox"> 비밀글
				</div>
			</div>
			<div class="row">
				<div class="col-auto">
					<b>제목</b>
				</div>
				<div class="col-7">
					<input name="subject" type="text" class="form-control">
				</div>
			</div>
		</div>
		<div style="margin-top: 10px; background-color: white;">
			<textarea name="content" id="content" rows="10" style="background-color: white; width: 100%; height: 412px;"></textarea>
		</div>
		<table class="table table-bordered">
				<tr>
					<th>파일</th>
					<td><input type="file" name="file_name"></td>
				</tr>
		</table>
		<div style="margin-top: 10px;" align="center">
			<button id="btn-board_write" class="btn btn-success">작성하기</button> <button class="btn btn-warning">취소</button>
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