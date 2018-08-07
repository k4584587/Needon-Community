
 function check(){
	 if($.trim($("#username").val())==""){
		 alert("회원아이디를 입력하세요!");
		 $("#username").val("").focus();
		 return false;
	 }
	 if($.trim($("#password").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#password").val("").focus();
		 return false;
	 }
	 if($.trim($("#password2").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#password2").val("").focus();
		 return false;
	 }
	 if($.trim($("#password").val()) != $.trim($("#password2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#password").val("");
		 $("#password2").val("");
		 $("#password").focus();
		 return false;
	 }
	 
	 if($.trim($("#name").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#name").val("").focus();
		 return false;
	 }
	 if($.trim($("#nick").val())==""){
		 alert("닉네임을 입력하세요!");
		 $("#nick").val("").focus();
		 return false;
	 }
	 if($.trim($("#birth1").val())==""){
		 alert("생년월일을 입력하세요!");
		 $("#birth1").val("").focus();
		 return false;
	 }
	 if($.trim($("#birth2").val())==""){
		 alert("생년월일을 입력하세요!");
		 $("#birth2").val("").focus();
		 return false;
	 }
	 
	 /*if($.trim($("#tel2").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#tel2").val("").focus();
		 return false;
	 }
	 if($.trim($("#tel3").val())==""){
		 alert("전화번호를 입력하세요!");
		 $("#tel3").val("").focus();
		 return false;
	 }*/
	 if($.trim($("#phone2").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#phone3").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#phone3").val("").focus();
		 return false;
	 }
	 if($.trim($("#mailid").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#mailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#domain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#domain").val("").focus();
		 return false;
	 }		 
	 /* if($.trim($("#join_zip1").val())==""){
	 alert("우편번호를 입력하세요!");
	 $("#join_zip1").val("").focus();
	 return false;
 	}*/
	 /*if($.trim($("#join_zip2").val())==""){
	 alert("우편번호를 입력하세요!");
	 $("#join_zip2").val("").focus();
	 return false;
 	}*/
	 if($.trim($("#address1").val())==""){
		 alert("주소를 입력하세요!");
		 $("#address1").val("").focus();
		 return false;
	 }
	 if($.trim($("#address2").val())==""){
		 alert("나머지 주소를 입력하세요!");
		 $("#address2").val("").focus();
		 return false;
	 }
 }
 
 function post_search(){
		alert("우편번호 검색 버튼을 클릭하세요!");
	}
 












 
 
 
 