<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <sec:authentication property="principal" var="user"/>
 
  <h2>아이디 확인</h2>
  <form method="post" action="<c:url value="/user/check_result"/>">
  	<table>
  		<tr>
  			<th>아이디</th>
  			<td>${user.username}</td>
  		</tr>
  		<tr>
  			<th>비밀번호</th>
  			<td><input type="password" name="password"  required = "required"></td>
  		</tr>
  		<tr>
  			<td rowspan="2">
  				<button type="submit">확인</button>
  				<a href="<c:url value="/"/>">취소</a></td>
  			</td>
  		</tr>
  	</table>
  </form>  
     