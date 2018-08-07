<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/member.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//우편번호, 주소 Daum API
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
				document.getElementById('post').value = data.zonecode;
				document.getElementById('address1').value = data.address;
			}
		}).open()
	}
</script>
</head>
<body>
	
	<form name="f" method="post" action=<c:url value="/user/userJoin_ok"/> onsubmit="return check()" 
			enctype="multipart/form-data"> 
			
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td><input name="username" id="username" size="14" value=1 /> 
				<input type="button" value="중복체크" onclick="id_check()" /></td>
			</tr>
			 <tr>
				<th>비밀번호</th>
				<td><input type="password" id="password" name="password" value=1 /></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="password2" name="password2" value=1 /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input id="name" name="name" value=1 /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input id="nick" name="nick" value=1 /></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><%@ include file="include/phone_number.jsp"%>
					<select name="phone1">
						<c:forEach var="t" items="${phone }" begin="0" end="16">
							<option value="${t }">${t }</option>
						</c:forEach>
				</select>-<input name="phone2" id="phone2" size="4" maxlength="4" value=1 />-<input
					name="phone3" id="phone3" size="4" maxlength="4" value=1 /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input  id="birth1" name="birth1" value=1 />-<input type="password" id="birth2" name="birth2" value=1 />
				
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
				<input  type="radio" id="sex" name="sex" value="0" checked/>남
				<input  type="radio" id="sex" name="sex" value="1"/>여
				</td>
			</tr>
			
			

			<tr>
				<th>전자우편</th>
				<td><input name="mailid" id="mailid" size="10" value=1  />@
				<input name="domain"
					id="domain" size="20" readonly value=1  />
					 <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 //-->
					<select id="mail_list" name="mail_list" onchange="domain_list()">
						<option value="">=이메일선택=</option>
						<option value="daum.net" >daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="0">직접입력</option>
					</select>
				</td>
			</tr>

			<tr>
				<th>우편번호</th>
				<td>
					<input name="post" id="post" size="5" readonly onclick="post_search()" value=1 />
					<input type="button" value="우편번호검색" onclick="openDaumPostcode()" /></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name="address1" id="address1" size="50" readonly
					onclick="post_search()" value=1 /></td>
			</tr>
			<tr>
				<th>나머지 주소</th>
				<td><input name="address2" id="address2" size="40" value=1 /></td>
			</tr>
			<tr>
				<th>프로필</th>
				<td><input type="text" name="profile" id="profile" size="50" /></td>
			</tr>

			<tr>
				<th>프로필사진</th>
				<td><input type="file" id="photo" name="photo1" /></td>
			</tr> 
		</table>

		<div id="join_menu" align=center>
			<input type="submit" value="회원가입" />
			 <input type="reset" value="가입취소"
				onclick="$('#id').focus();" />
		</div>
	</form>
	
</body>
</html>