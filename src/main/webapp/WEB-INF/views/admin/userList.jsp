<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function check(){
		if($.trim($("#keyword").val())==""){
		alert("검색어를 입력하세요");
		$("#keyword").val("").focus();
		return false;
		}
	}
</script>
</head>
<title>유저 목록</title>
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
		<td>활성화</td>
		<td>권한</td>
		<td>관리</td>
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
		<td>${b.enabled }</td>
		
		<td>
		<c:choose>
		<c:when test="${b.getUserRole.get(0).role eq 'ROLE_ADMIN'}">
			관리자
		</c:when>
		<c:when test="${b.getUserRole.get(0).role eq 'ROLE_USER'}">
			일반
		</c:when>
		</c:choose>
		</td>
		<td>
		<input type="button" value="수정" onClick="location.href='<c:url value='/admin/userModifyForm?username=${b.username}' />'">
		</td>
	</tr>
	</c:forEach>
</table>
<center>
	<%-- <c:if test="${page <= 1 }">
		[이전]&nbsp;
	</c:if> --%>
	
	<c:if test="${page>1}">
		<a href="<c:url value="/admin/userList?page=${page-1 }" />">[이전]</a>
	</c:if>
	<c:forEach var="a" begin="${startpage }" end="${endpage }">
		<c:if test="${a==page }">
			[${a }]
		</c:if>
		<c:if test="${a != page }">
			<a href="<c:url value="/admin/userList?page=${a }" />">[${a }]</a>
		</c:if>
	</c:forEach>
	
	<%-- <%-- <c:if test="${page>=maxpage }">
	[다음]
	</c:if> --%>
	<c:if test="${page<maxpage }">
		<a href="<c:url value="/admin/userList?page=${page+1 }" />">[다음]</a>
	</c:if>
		
</center>
<form action=<c:url value="/admin/search"/> name="search" method="post">
	<select name="keyfield">
		<option value="username" selected>아이디</option>
		<option value="name" >이름</option>
		<option value="nick" >닉네임</option>
		<option value="phone" >핸드폰</option>
		<option value="email" >이메일</option>
		
	</select>
	<input type="text" name="keyword" id="keyword">
	<input type="submit" value="검색" onclick="return check()"	>
</form>
</body>
</html>