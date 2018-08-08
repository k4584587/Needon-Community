<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 7. 31.
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<!-- insert bootstrap css -->
<link rel="stylesheet"
      href="<c:url value="/resources/css/bootstrap/css/bootstrap.css" />">

<!-- insert bootstrap js -->
<script src="//code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script
        src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script
        src="//stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

<!-- insert custom css -->
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">

<link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
      integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
      crossorigin="anonymous">
      
<script>      
      /*비번찾기 공지창*/
 function psw_find(){
	 window.open("psw_find","비번찾기","width=400,height=400");
 }
 </script>

<script
        src="//code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>

<body>
<style>
    .error {
        text-align: left!important;
        margin-top: 10px;
        margin-bottom: 10px;
        color: red;
    }
</style>
<center style="margin-top: 10px;">
    <div class="login-form">
        <div class="login-form">
            <form class="form-signin" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <img class="mb-4" src="<c:url value="/resources/img/logo.png" />">
                <h1 class="h3 mb-3 font-weight-normal">니드온 로그인</h1>
                <label for="inputUsername" class="sr-only">아이디</label>
                <input type="text" name="username" id="inputUsername" class="form-control" placeholder="아이디" required autofocus>
                <span id="username_input_error"></span>
                <label for="inputPassword" class="sr-only">비밀번호</label>
                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
                <span id="password_input_error"></span>
                <div class="checkbox mb-3">
                    <c:if test="${param.error != null}">
                        <div class="error">아이디 또는 비밀번호를 다시 확인하세요.</div>
                    </c:if>
                    <label>
                        <input type="checkbox" value="remember-me"> 자동로그인
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
                <a href="<c:url value="/user/userJoinForm" />" class="btn btn-lg btn-success btn-block" style="color: white">회원가입</a>
                <input type="button" value="비번찾기" class="btn btn-lg btn-primary btn-block" onclick="psw_find()" />
                <p class="mt-5 mb-3 text-muted">&copy; Needon 2018</p>
            </form>
        </div>
    </div>
</center>
<script>

    $(function () {

        console.log("login ajax call!");
        $("input[id='inputUsername']").on("input", function() {
            console.log("아이디 입력값 " + $("input[id='inputUsername']").val().length);
            if($("input[id='inputUsername']").val().length == 0) {
                console.log("아이디 입력값이 null 임");
                $.ajax({
                    async:true,
                    type:'GET',
                    contentType: "application/json; charset=UTF-8",
                    success : function(data) {
                        var error_html = "<div class=\"error\">아이디를 입력해주세요.</div>";
                        $('#username_input_error').html(error_html);
                    }
                });
            } else {
                console.log("값이 입력됨");
                $('#username_input_error').html(null);
            }
        });

        $("input[id='inputPassword']").on("input", function() {

            if($("input[id='inputPassword']").val().length == 0) {
                console.log("아이디 입력값이 null 임");
                $.ajax({
                    async:true,
                    type:'GET',
                    contentType: "application/json; charset=UTF-8",
                    success : function(data) {
                        var error_html = "<div class=\"error\">비밀번호를 입력해주세요.</div>";
                        $('#password_input_error').html(error_html);
                    }
                });
            } else {
                console.log("값이 입력됨");
                $('#password_input_error').html(null);
            }
        });

    })

</script>
</body>
</html>
