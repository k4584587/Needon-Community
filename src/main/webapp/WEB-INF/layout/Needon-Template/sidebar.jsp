<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="p-3">
	<sec:authorize access="!isAuthenticated()">
		<a href="<c:url value="/user/login" />"> <img src="<c:url value="/resources/img/login_btn.png" />"> </a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="user" />
		<!-- 여기서부턴 로그인 됨 { -->
		<div class="card">
			<div class="card-body">
				<div class="row" style="margin-bottom: 10px;">
					<div class="col-auto" style="padding-right: 0px!important;">
						<%--회원가입 구현되면 여기는 프로필 사진이 오는곳으로 수정바람--%>
						<img src="http://via.placeholder.com/52">
					</div>
					<div class="col-auto">
						<div>${user.username} 님 <a href="#">내정보</a></div>
						<div><a href="#"><b>내 블로그</b></a> <a href="#"><b>쪽지(0)</b></a></div>
					</div>
				</div>
				<form action="<c:url value="/logout" />" method="post" style="margin-bottom: 10px;">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<button type="submit" class="btn btn-primary btn-block">로그아웃</button>
				</form>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="<c:url value="/admin/" />" class="btn btn-danger btn-block" style="color: white">관리자</a>
				</sec:authorize>
			</div>
		</div>
		<!-- 로그인 됨 끝 } -->
	</sec:authorize>
</div>