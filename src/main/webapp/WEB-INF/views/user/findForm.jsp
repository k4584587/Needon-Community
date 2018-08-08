<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
${count }

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
  <c:if test="${count eq 0}"> 
  ${count }
    <h2>비밀번호 찾기 </h2>
    <form method="post" action="/community/user/psw_check"
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
  <form method="post" action="/community/user/check_ok">
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
  <form method="post" action="/community/user/psw_change">
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
  
  
  

  
  
 
 
