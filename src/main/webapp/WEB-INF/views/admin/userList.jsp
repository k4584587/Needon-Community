<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 목록</title>
</head>
<body>
유저 수 : ${listcount }
<table border=1 align=center >
	<tr>
		<td>회원번호</td>
		<td>id</td>
		<td>이름</td>
		<td>닉네임</td>
		<td>핸드폰</td>
		<td>생년월일</td>
		<td>성별</td>
		<td>이메일</td>
		<td>주소1</td>
		<td>주소2</td>
		<td>포인트</td>
		<td>팔로워</td>
		<td>레벨</td>
		<td>exp</td>
		<td>메일확인여부</td>
		<td>메세지확인여부</td>
		<td>가입일</td>
		<td>마지막로그인</td>
	</tr>
	
	<!-- 화면 출력 번호 변수 정의 -->
	<c:set var="num" value="${listcount-(page-1)*limit }"/>
	<!-- 반복문 시작 -->
	<c:forEach var="b" items="${userList }">
	<tr>
		<td>${num }</td>
		<c:set var="num" value="${num-1 }"/>
		
		<td>${b.username }</td>
		<td>${b.name }</td>
		<td>${b.nick }</td>
		<td>${b.phone }</td>
		<td>${b.birth}</td>
		<td>
		<c:choose>
			<c:when test="${b.sex eq 1}">
				남자
			</c:when>
			<c:when test="${b.sex eq 0 }">
				여자
			</c:when>	
		</c:choose>
		</td>
		<td>${b.email }</td>
		<td>${b.address1 }</td>
		<td>${b.address2 }</td>
		<td>${b.point}</td>
		<td>${b.follow }</td>
		<td>${b.level}</td>
		<td>${b.exp}</td>
		<td>
		<c:choose>
			<c:when test="${b.email_ck eq 1}">
				Y
			</c:when>
			<c:when test="${b.email_ck eq 0}">
				N
			</c:when>
		</c:choose>		
		</td>
		<td>
		<c:choose>
			<c:when test="${b.msg_ck eq 1}">
				Y
			</c:when>
			<c:when test="${b.msg_ck eq 0}">
				N
			</c:when>
		</c:choose>		
		</td>
		<td>
		<fmt:formatDate value="${b.register_date}" pattern="yyyy-MM-dd HH:mm"/>
		</td>
		<td>
		<fmt:formatDate value="${b.last_date}" pattern="yyyy-MM-dd HH:mm"/>
		</td>
	</tr>
	</c:forEach>
</table>
<center>
	<%-- <c:if test="${page <= 1 }">
		[이전]&nbsp;
	</c:if> --%>
	
	<c:if test="${page>1}">
		<a href="admin/userList?page=${page-1 }">[이전]</a>	
	</c:if>
	<c:forEach var="a" begin="${startpage }" end="${endpage }">
		<c:if test="${a==page }">
			[${a }]
		</c:if>
		<c:if test="${a != page }">
			<a href="admin/userList?page=${a }">[${a }]</a>
		</c:if>
	</c:forEach>
	
	<%-- <%-- <c:if test="${page>=maxpage }">
	[다음]
	</c:if> --%>
	<c:if test="${page<maxpage }">
		<a href="admin/userList?page=${page+1 }">[다음]</a>
	</c:if>
		
</center>
</body>
</html>