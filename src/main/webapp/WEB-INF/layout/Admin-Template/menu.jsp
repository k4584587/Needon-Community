<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 메뉴비 사직 -->
<nav class="navbar navbar-expand-lg navbar-dark blue-theme">
	<div class="container">
		<div class="collapse navbar-collapse" id="navbarsExample07">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="<c:url value="/board/notice/list" />">공지사항</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/board/freeboard/list" />">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/board/qna/list" />">문의사항</a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
			</ul>
			<form class="form-inline my-2 my-md-0">
				<input class="form-control" type="text" placeholder="검색"
					aria-label="Search">
			</form>
		</div>
	</div>
</nav>   
