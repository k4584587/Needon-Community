<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
	
	<form name="f" method="post" action=<c:url value="/admin/userModify_ok"/> 
			enctype="multipart/form-data"> 
			
			<input type="hidden" name="username" value="${user.username }"/>
			<input type="hidden" name="password" value="${user.password }"/>
			<%-- <input type="hidden" name="register_date" value="${user.register_date }"/>
			<input type="hidden" name="last_date" value="${user.last_date }"/> --%>
			<input type="hidden" name="follow" value="${user.follow }"/>
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td><input size="14" value="${user.username }" readonly/> 
			
			
				<th>이름</th>
				<td><input id="name" name="name" value="${user.name }" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input id="nick" name="nick" value="${user.nick }" /></td>
			
				<th>핸드폰</th>
				<td><input id="phone" name="phone" value="${user.phone }" /></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input  id="birth" name="birth" value="${user.birth }" /></td>
			
				<th>이메일</th>
				<td><input  id="email" name="email" value="${user.email }" /></td>
			</tr>

			<tr>
				<th>우편번호</th>
				<td>
					<input name="post" id="post" size="5" readonly onclick="post_search()" value="${user.post }" />
					<input type="button" value="우편번호검색" onclick="openDaumPostcode()" /></td>
			
				<th>주소</th>
				<td><input name="address1" id="address1" size="50" readonly
					onclick="post_search()" value="${user.address1 }" /></td>
			</tr>
			<tr colsapan="2">
				<th>나머지 주소</th>
				<td><input name="address2" id="address2" size="40" value="${user.address2 }" /></td>
		
				<th>프로필</th>
				<td><input type="text" name="profile" id="profile" size="50" value="${user.profile }"/></td>
			</tr>

			<tr>
				<th >프로필사진</th>
				<td  ><input type="file" id="photo" name="img" /></td>
				
				<th>권한</th>
				<td>
				<select id="role" name="role" title="권한">
					<option value="ROLE_ADMIN" <c:if test="${role eq 'ROLE_ADMIN' }">selected</c:if>>관리자</option>
					<option value="ROLE_USER" <c:if test="${role eq 'ROLE_USER' }">selected</c:if>>회원</option>
				
				</select>
				</td>
			</tr> 
			<tr >
				<th>성별</th>
				<td>
				<select id="sex" name="sex" title="성별">
					<option value="1" <c:if test="${user.sex eq '1' }">selected</c:if>>남자</option>
					<option value="0" <c:if test="${user.sex eq '0' }">selected</c:if>>여자</option>
				
				</select>
				</td>
			
			
				<th>메일확인여부</th>
				<td>
				<select id="email_ck" name="email_ck" title="메일확인여부">
					<option value="1" <c:if test="${user.email_ck eq '1' }">selected</c:if>>수신</option>
					<option value="0" <c:if test="${user.email_ck eq '0' }">selected</c:if>>거부</option>
				</select>
				</td>
				
			</tr>
			<tr>
			<th>메세지확인여부</th>
				<td>
				<select id="msg_ck" name="msg_ck" title="메세지확인여부">
					<option value="1" <c:if test="${user.msg_ck eq '1' }">selected</c:if>>수신</option>
					<option value="0" <c:if test="${user.msg_ck eq '0' }">selected</c:if>>거부</option>
				</select>
				</td>
			<th>활성화</th>
				<td>
				<select id="enabled" name="enabled" title="활성화">
					<option value="true" <c:if test="${user.enabled eq 'true' }">selected</c:if>>활성</option>
					<option value="false" <c:if test="${user.enabled eq 'false' }">selected</c:if>>휴면</option>
				</select>
				</td>
			
			</tr>
			<tr>
				<th>팔로우</th>
				<td>${user.follow }</td>
			
				<th>레벨</th>
				<td>${user.level }</td>
			</tr>
			<tr>
				<th>exp</th>
				<td>${user.exp }</td>
				<th>포인트</th>
				<td>${user.point }</td>
			
			</tr>
			
		</table>

		<div id="join_menu" align=center>
			<input type="submit" value="수정" />
			 <input type="reset" value="원래대로"
				onclick="$('#id').focus();" />
		</div>
	</form>
	
</body>
</html>