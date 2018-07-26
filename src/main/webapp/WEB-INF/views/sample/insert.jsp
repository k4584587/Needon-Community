<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>   
<body>
	<form action="<c:url value="/sample/insert.post" />" method=post>
		<input type="text" name="name">
		<input type="text" name="context">
		<input type="submit" value="전송">
	</form>
</body>
</html>