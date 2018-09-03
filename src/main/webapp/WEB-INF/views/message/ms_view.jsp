<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
				   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
				   user="admin_project" password="3class"/>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>쪽지 보기</title>
<link rel="stylesheet" href="//stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<c:if test="${ms.info_read_count eq 0}">
	<sql:update dataSource="${datasource}">
		UPDATE
		nb_message
		SET
		info_read_count = 1
		WHERE
		you = '${user.username}'
		AND
		no = ${ms.no}
	</sql:update>
</c:if>

 <script>
  function ms_close(){
		 window.close();
  }
</script>
<style>
	body {
		font-size: 13px;
	}

	table {
		font-size: 13px!important;
	}

	.send_link {
		color: white;
	}

	.send_link:hover {
		color:white;
	}
</style>
<div style="height: 5px;background-color: black;margin-bottom: 10px;"></div>
<div style="margin-left: 5px;">
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-auto">
			<img width="65" src="<c:url value="/resources/img/profile_img.png" />">
		</div>
		<div class="col-auto">${user.nick} 님의 받은 쪽지 보기</div>
	</div>
	<div class="row" style="background-color: black;">
		<div class="col p-2" style="color: white;text-align: center;"><a href="<c:url value="/message/ms_list" />" class="send_link">받은 쪽지함</a></div><div class="col p-2" style="color: white;text-align: center"><a href="<c:url value="/message/send_list" />" class="send_link">보낸 쪽지함</a></div><div class="col p-2" style="color: white;text-align: center"><a class="send_link" onClick="ms_send()" href="#">쪽지 쓰기</a></div>
	</div>
	<div class="p-2" style="background-color: #fafafa;border-bottom: 1px solid #eee">
		보낸사람 <b>${ms.username }</b>
	</div>
	<div class="p-3" style="border-bottom: 1px solid #eee;">
		test
	</div>
	<div style="margin-top: 10px;">
		<input type="submit" class="btn btn-success btn-sm" value="답장" />
		<button class="btn btn-secondary btn-sm" onClick="ms_close()">취소</button>
	</div>
</div>

<%--
<form action="<c:url value="/message/replyForm"/>"  method="post" >
			<input type="hidden" name=username value="${ms.username }">
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td>${ms.username }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${ms.content }</td>
			</tr>

		</table>

		<div id="join_menu" align=center>
		
		
		
			<input type="submit" value="답장" />
			<button onClick="ms_close()">취소</button>
		</div>
	</form>
--%>


</body>
</html>