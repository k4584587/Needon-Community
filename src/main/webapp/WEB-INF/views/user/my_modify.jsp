<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
     <sec:authentication property="principal" var="user"/>
     
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
     
  <form method="post" action=<c:url value="/user/my_update"/> onsubmit="return check()" 
			enctype="multipart/form-data">
     <table boder="1" align=center>
		<tr>
			<th>아이디</th>
			<td>${user.username}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${user.name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${user.nick}</td>
		</tr>
		<tr>
			<th>핸드폰</th>
			<td>
     			<select name="Phone1" required = "required">
      				<option vlaue="">=번호선택=</option>
      				<option value="010" <c:if test="${Phone1 == '010' }">${'selected' }</c:if>>010</option>
      				<option value="011" <c:if test="${Phone1 == '011' }">${'selected' }</c:if>>011</option>
      				<option value="016" <c:if test="${Phone1 == '016' }">${'selected' }</c:if>>016</option>
      				<option value="017" <c:if test="${Phone1 == '017' }">${'selected' }</c:if>>017</option>
      				<option value="018" <c:if test="${Phone1 == '018' }">${'selected' }</c:if>>018</option>
     			</select>
     			-
     			<input name="Phone2" id="Phone2" size="4" maxlength="4" value="${Phone2}" required = "required"/>
     			-
     			<input name="Phone3" id="Phone3" size="4" maxlength="4" value="${Phone3}" required = "required"/>
     		</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${user.birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${user.sex}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
     			<input type="text" name="email2" name="email2" value="${email1 }" required = "required">
     			@ 
				<select name="email2" onchange="domain_list()" required = "required">
    			  <option value="">=이메일선택=</option>
      			  <option value="daum.net"  <c:if test="${email2 == 'daum.net'}">${'selected'} </c:if>>daum.net</option>
      			  <option value="nate.com"  <c:if test="${email2 == 'nate.com'}">${'selected'} </c:if>>nate.com</option>
      			  <option value="naver.com" <c:if test="${email2 == 'naver.com'}">${'selected'} </c:if>>naver.com</option>
      			  <option value="hotmail.com" <c:if test="${email2 == 'hotmail.com'}">${'selected'} </c:if>>hotmail.com</option>
      			  <option value="gmail.com" <c:if test="${email2 == 'gmail.com'}">${'selected'} </c:if>>gmail.com</option>
      			  <option value="0">직접입력</option>
     			</select>
     		</td>
		</tr>
		<tr>
     <th>우편번호</th>
     <td>
      	<input name="post" id="post" size="5" readonly onclick="post_search()" value="${user.post}" required = "required"/>
		<input type="button" value="우편번호검색" onclick="openDaumPostcode()" /></td>
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="address1" id="address1" size="50" readonly value="${user.address1}" onclick="post_search()" required = "required"/>
     </td>
    </tr>
    
    <tr>
     <th>나머지 주소</th>
     <td>
      <input name="address2" id="address2" size="37"  value="${user.address2}" required = "required"/>
     </td>
    </tr>
		<tr>
			<th>프로필</th>
			<td><input type="text" name="profile" id="profile" size="50"  value="${user.profile}" required = "required"/></td>
		</tr>
		<tr>
			<td rowspan=2>
				<input type="submit" value="수정" />
				<a href="<c:url value="/"/>">홈</a>
			</td>
		</tr>
		
   </table>
 </form>