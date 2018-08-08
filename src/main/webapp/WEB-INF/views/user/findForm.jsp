<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
${count }
<script src="//cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
<script
        src="//code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
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
  ${count }
    <h2>비밀번호 찾기 </h2>
    <form method="post" action="<c:url value="/user/psw_check" />"
  		onsubmit="return check()">  
  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   <table id="pwd_t">
    <tr>
     <th>아이디</th>
     <td><input name="username" id="id" size="14" class="input_box" />
            <span id="username_input_error"></span>
     </td>
    </tr>
    
    <tr>
     <th>이메일</th>
     <td><input name="email" id="email" size="14" class="input_box" />
     		<span id="email_input_error"></span>
     </td>
    </tr>
    
   </table>
    <input type="submit" value="찾기" class="input_button" />
    <input type="reset" value="취소" class="input_button"  onclick="$('#id').focus();"/>
    <input type="button" value="닫기" class="input_button" onclick="self.close();" />
  </form>
</c:if>
  
<c:if test="${count eq  1}">
${count }
${psw_check }

  ${check_no }
  	<h2>암호 확인 </h2>
  <form method="post" action="<c:url value="/user/check_ok" />">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="hidden" name="username" value=${psw_check }>
  
   <table>
    <tr>
     <th>암호</th>
     <td>
      <input type="text" name="number2"/>
     </td>
    </tr>
    
   </table>
    <input type="submit" value="확인" class="input_button" />
      <input type="button" value="닫기" class="input_button" onclick="self.close();" />
  </form>	
  </c:if>
  
  
  
  
  
  <c:if test="${count eq 2}">
  ${id }
  ${count }
  <h2> 비밀번호 변경 </h2>
  <form method="post" action="<c:url value="/user/psw_change" />">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input type="hidden" name="username" value=${id }>
  
   <table>
    <tr>
     <th>새 비밀번호</th>
     <td>
      <input type="password" name="password"/>
     </td>
    </tr>    
    <tr>
     <th>비밀번호 확인</th>
     <td>
      <input type="password" name="password2"/>
     </td>
    </tr>
    
   </table>
     <input type="submit" value="수정" class="input_button" />
     <input type="reset" value="취소" class="input_button"  onclick="$('#id').focus();"/>
     <input type="button" value="닫기" class="input_button" onclick="self.close();" />
      
  </form>
  </c:if>
  

</body>
