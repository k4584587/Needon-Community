﻿
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
	  if($.trim($("#post").val())==""){
	 alert("우편번호를 입력하세요!");
	
	 return false;
 	}
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
 
 function domain_list() {
	 var num=f.mail_list.selectedIndex;
	 
	 /*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	  */
	 //alert(f.mail_list.options[num].value);
	 //num==-1은 해당 리스트 목록이 없다
	 if(num==-1){
		 return true;
	 }
	 if(f.mail_list.value=="0")
	 {
		 f.domain.value="";
		 f.domain.readOnly=false;
		 f.domain.focus();
	 }
	 
	 else{
		 //리스트 목록을 선택했을 때
		 f.domain.value=f.mail_list.options[num].value;
		 f.domain.readOnly=true;
		 
	 }
	 
 }











 
 
 
 