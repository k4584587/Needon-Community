<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 7. 31.
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

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

</head>
<body>
<center style="margin-top: 10px;">
    <div class="login-form">
        <form class="form-signin">
            <img class="mb-4" src="<c:url value="/resources/img/logo.png" />">
            <h1 class="h3 mb-3 font-weight-normal">니드온 로그인</h1>
            <label for="inputUsername" class="sr-only">아이디</label>
            <input type="text" name="username" id="inputUsername" class="form-control" placeholder="아이디" required autofocus>
            <label for="inputPassword" class="sr-only">비밀번호</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> 자동로그인
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
            <button class="btn btn-lg btn-success btn-block" type="submit">회원가입</button>
            <p class="mt-5 mb-3 text-muted">&copy; Needon 2018</p>
        </form>

    </div>
</center>
</body>
</html>

