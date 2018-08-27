<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
				   url="jdbc:log4jdbc:mysql://13.125.208.101/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC&useSSL=false&autoReconnectForPools=true&autoReconnection=true&testWhileIdle=false"
				   user="admin_project" password="3class"/>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

${ms }

${ms.info_read_count}

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


</body>
</html>