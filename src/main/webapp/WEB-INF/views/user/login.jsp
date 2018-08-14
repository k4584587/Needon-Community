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

        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#login">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#join">회원가입</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane container active" id="login">
                <form class="form-signin" action="<c:url value="/user/login.check" />" method="post">
                    <img class="mb-4" src="<c:url value="/resources/img/logo.png" />">
                    <label for="inputUsername" class="sr-only">아이디</label>
                    <input type="text" name="username" id="inputUsername" class="form-control" placeholder="아이디" required autofocus>
                    <span id="username_input_error"></span>
                    <label for="inputPassword" class="sr-only">비밀번호</label>
                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
                    <span id="password_input_error"></span>
                    <c:if test="${ param.error != null}">
                        <div class="error">아이디 또는 비밀번호를 다시 확인해 주세요.</div>
                    </c:if>
                    <div class="checkbox mb-3">
                        <label style="float: left!important;">
                            <input type="checkbox" value="remember-me" style="margin-top: 10px"> 자동로그인
                        </label>
                    </div>
                    <button id="btn-login" class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
                    <hr>
                    <a style="float: left!important;"  href="#" onclick="psw_find()">비밀번호 찾기</a>
                    <p class="mt-5 mb-3 text-muted">&copy; Needon 2018</p>
                </form>
            </div>
            <div class="tab-pane container fade" id="join" style="margin-top: 10px;">
                <img class="mb-4" src="<c:url value="/resources/img/logo.png" />">

                <form class="form-signin" action="<c:url value="/user/userJoin_ok" />" method="post" enctype="multipart/form-data">
                    <div class="input-group mb-3">

                        <input name="username" id ="username" type="text" class="form-control" placeholder="아이디" required>
                        <div class="input-group-append">
                            <button class="btn btn-lg btn-success btn-block" onclick="id_check()">중복확인</button>
                        </div>
                    </div>
                    <div id="idcheck" style="margin-bottom: 10px"></div>
                    <input type="text" id="inputEmail" class="form-control" placeholder="이름" name="name" required autofocus>
                        <input type="text" id="inputEmail" class="form-control" placeholder="닉네임" name="nick" required>

                        <input type="password" id="inputPassword" class="form-control" placeholder="패스워드" name="password" required>
                        <input type="password" id="inputPassword" class="form-control" placeholder="패스워드 확인" name="password_re" required>
                        <input type="email" id="inputEmail" class="form-control" placeholder="이메일" name="email" required>
                        <input id="cellPhone" name="phone" class="form-control" type="tel" maxlength="13"  placeholder="형식) 010-123-1234" required>
                        <textarea class="form-control" name="profile" placeholder="자기소개"></textarea>
                        <br>
                        <label>프로필 사진</label>
                        <input type="file" id="img" name="img" class="form-control" placeholder="프로필 사진">
                        <br>
                        <input type="submit" class="btn btn-lg btn-primary btn-block" value="회원가입">
                </form>
            </div>
        </div>

    </div>
</center>
<script>

    $(document).ready(function () {
        //한글입력 안되게 처리
        $("input[name=username]").keyup(function (event) {
            if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^a-z0-9]/gi, ''));
            }
        });
    });

    function autoHypenPhone(str) {
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if (str.length < 4) {
            return str;
        } else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        } else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        } else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }

    var cellPhone = document.getElementById('cellPhone');
    cellPhone.onkeyup = function (event) {
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenPhone(_val);
    };



    $(function () {
        console.log("login ajax call!");
        $("input[id='inputUsername']").on("input", function() {
            console.log("ghldn아이디 입력값 " + $("input[id='inputUsername']").val().length);
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
    
    
    /* 아이디 중복 체크*/
 function id_check(){
 	$("#idcheck").hide(); 
 	var memid=$("#username").val();  
 	//입력글자 길이 체크
 	if($.trim($("#username").val()).length < 4){
 		var newtext='<div style="color: red">아이디는 4자 이상이어야 합니다.</div>';
 		$("#idcheck").text('');
 		$("#idcheck").show();
 		$("#idcheck").append(newtext); 
 		$("#username").val("").focus();
 		return false;
 	};
 	//입력글자 길이 체크
 	if($.trim($("#username").val()).length >12){
 		var newtext='<div color="red">아이디는 12자 이하이어야 합니다.</div>';
 		$("#idcheck").text('');
 		$("#idcheck").show();
 		$("#idcheck").append(newtext); 
 		$("#username").val("").focus();
 		return false;
 	};
 	 //입력아이디 유효성 검사
 	if(!(validate_userid(memid))){
 		var newtext='<div color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</div>';
 		$("#idcheck").text('');
 		$("#idcheck").show();
 		$("#idcheck").append(newtext);
 		$("#username").val("").focus();
 		return false;
 	};
 	
 	
 	 
 	 
 	//아이디 중복확인
     $.ajax({
         type:"POST",
         /*url:"./jsp/member/member_idcheck.jsp",*/
         url:"<c:url value='/user/id_check' />",     
         data: {"memid":memid},   
         success: function (data) { 
//       console.log("AJAX 호츨 데이터 ==> " + data.body);
//    	 console.log("중복체크 ajax실행");
       	 if(data==1){	//중복 ID
       		var newtext='<div style="color:red;">중복 아이디입니다.</div>';
       			$("#idcheck").text('');
         		$("#idcheck").show();
         		$("#idcheck").append(newtext);
           		$("#username").val().focus();
           		return false;
 	     
       	  }else{	//사용 가능한 ID
       		var newtext='<div style="color:blue;">사용가능한 아이디입니다.</div>';
       		$("#idcheck").text('');
       		$("#idcheck").show();
       		$("#idcheck").append(newtext);
       		$("#username").focus();
       	  }  	    	  
         }
         ,
     	  error:function(e){
     		  alert("data error"+e);
     	  } 
     
     });
 };

 function validate_userid(memid)
 {
   var pattern= new RegExp(/^[a-z0-9_]+$/);
   //영문 소문자,숫자 ,_가능,정규표현식
   return pattern.test(memid);
 };

</script>
</body>
</html>
