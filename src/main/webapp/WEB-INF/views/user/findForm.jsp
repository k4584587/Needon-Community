<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
    <script src="//code.jquery.com/jquery-3.3.1.js"></script>
</head>

<script>
    paceOptions = {
        // Disable the 'elements' source
        elements: false,

        // Only show the progress on regular and ajax-y page navigation,
        // not every request
        restartOnRequestAfter: false
    }
</script>
<style>

    body {
        font-size: 13px;
    }

    .pace.pace-inactive {
        display: none;
    }

    .pace {
        -webkit-pointer-events: none;
        pointer-events: none;

        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;

        z-index: 2000;
        position: fixed;
        height: 60px;
        width: 100px;
        margin: auto;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }

    .pace .pace-progress {
        z-index: 2000;
        position: absolute;
        height: 60px;
        width: 100px;

        -webkit-transform: translate3d(0, 0, 0) !important;
        -ms-transform: translate3d(0, 0, 0) !important;
        transform: translate3d(0, 0, 0) !important;
    }

    .pace .pace-progress:before {
        content: attr(data-progress-text);
        text-align: center;
        color: #fff;
        background: #29d;
        border-radius: 50%;
        font-family: "Helvetica Neue", sans-serif;
        font-size: 14px;
        font-weight: 100;
        line-height: 1;
        padding: 20% 0 7px;
        width: 50%;
        height: 40%;
        margin: 10px 0 0 30px;
        display: block;
        z-index: 999;
        position: absolute;
    }

    .pace .pace-activity {
        font-size: 15px;
        line-height: 1;
        z-index: 2000;
        position: absolute;
        height: 60px;
        width: 100px;

        display: block;
        -webkit-animation: pace-theme-center-atom-spin 2s linear infinite;
        -moz-animation: pace-theme-center-atom-spin 2s linear infinite;
        -o-animation: pace-theme-center-atom-spin 2s linear infinite;
        animation: pace-theme-center-atom-spin 2s linear infinite;
    }

    .pace .pace-activity {
        border-radius: 50%;
        border: 5px solid #29d;
        content: ' ';
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        height: 60px;
        width: 100px;
    }

    .pace .pace-activity:after {
        border-radius: 50%;
        border: 5px solid #29d;
        content: ' ';
        display: block;
        position: absolute;
        top: -5px;
        left: -5px;
        height: 60px;
        width: 100px;

        -webkit-transform: rotate(60deg);
        -moz-transform: rotate(60deg);
        -o-transform: rotate(60deg);
        transform: rotate(60deg);
    }

    .pace .pace-activity:before {
        border-radius: 50%;
        border: 5px solid #29d;
        content: ' ';
        display: block;
        position: absolute;
        top: -5px;
        left: -5px;
        height: 60px;
        width: 100px;

        -webkit-transform: rotate(120deg);
        -moz-transform: rotate(120deg);
        -o-transform: rotate(120deg);
        transform: rotate(120deg);
    }

    @-webkit-keyframes pace-theme-center-atom-spin {
        0%   { -webkit-transform: rotate(0deg) }
        100% { -webkit-transform: rotate(359deg) }
    }
    @-moz-keyframes pace-theme-center-atom-spin {
        0%   { -moz-transform: rotate(0deg) }
        100% { -moz-transform: rotate(359deg) }
    }
    @-o-keyframes pace-theme-center-atom-spin {
        0%   { -o-transform: rotate(0deg) }
        100% { -o-transform: rotate(359deg) }
    }
    @keyframes pace-theme-center-atom-spin {
        0%   { transform: rotate(0deg) }
        100% { transform: rotate(359deg) }
    }
</style>
 <script>
 function check(){
	 if($.trim($("#id").val())==""){
		 alert("아이디를 입력하세요!");
		 $("#id").val("").focus();
		 return false;
	 }
	 if($.trim($("#email").val())==""){
		 alert("이메일을 입력하세요!");
		 $("#email").val("").focus();
		 return false;
	 }
 }
</script>
<body>
<c:if test="${count eq 0}">
      <div class="p-3" style="background-color: #f5f5f5;border: 1px solid transparent;"><b>비밀번호 찾기</b></div>
      <div class="p-3">
          <div style="margin-bottom: 15px;">회원가입 시 등록하신 아이디와 이메일 주소를 입력해 주세요. 해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.</div>
          <form method="post" action="<c:url value="/user/psw_check" />">
              <input style="margin-bottom: 20px;" type="text" name="username" id="id" class="form-control" placeholder="아이디" required />
              <span id="username_input_error"></span>
              <input style="margin-bottom: 20px;" type="email" name="email" id="email" size="14" class="form-control" placeholder="이메일" required />
              <span id="email_input_error"></span>
              <input type="submit" value="찾기" class="btn btn-success btn-sm" />
              <input type="reset" value="취소" class="btn btn-warning btn-sm"  onclick="$('#id').focus();"/>
              <input type="button" value="닫기" class="btn btn-primary btn-sm" onclick="self.close();" />
          </form>
      </div>
</c:if>

<c:if test="${count eq  1}">
    <div class="p-3" style="background-color: #f5f5f5;border: 1px solid transparent;"><b>비밀번호 찾기</b></div>
    <div class="p-3">
        <div style="margin-bottom: 15px;">이메일로 발송된 인증번호를 입력해주세요.</div>
        <form method="post" action="<c:url value="/user/check_ok" />">
            <input style="margin-bottom: 20px;" type="text" name="number2" class="form-control" placeholder="인증번호"/>
            <input type="submit" value="확인" class="btn btn-success btn-sm" />
            <input type="button" value="닫기" class="btn btn-warning btn-sm" onclick="self.close();" />
        </form>
    </div>
</c:if>
<c:if test="${count eq 2}">
    <div class="p-3" style="background-color: #f5f5f5;border: 1px solid transparent;"><b>비밀번호 찾기</b></div>
    <div class="p-3">
        <div style="margin-bottom: 15px;">새 비밀번호를 입력해주세요.</div>
        <form method="post" action="<c:url value="/user/psw_change" />">
            <input style="margin-bottom: 20px;" class="form-control" type="password" name="password" placeholder="새 비밀번호"/>
            <input style="margin-bottom: 20px;" class="form-control" type="password" name="password2" placeholder="비밀번호 확인"/>
            <input type="submit" value="확인" class="btn btn-success btn-sm" />
            <input type="reset" value="취소" class="btn btn-danger btn-sm"  onclick="$('#id').focus();"/>
            <input type="button" value="닫기" class="btn btn-secondary btn-sm" onclick="self.close();" />
        </form>
    </div>
</c:if>
</body>
</html>