<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table>
<tr>
	<span><h2><th>검색:</th>${key }</h2></span>
</tr>
<c:forEach items="${list }" var="list">
<tr>
	<td>${list.subject }</td>
</tr>
<tr>
	<td>${list.wr_nick}</td>
</tr>
<tr>
	<td>${list.content}</td>
</tr>
<tr>
	<td>${list.bo_good}</td>
	<td>${list.read_count}</td>
	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ list.register_date }" /></td>
</tr>



</c:forEach>	
</table>
 
</body>
</html>