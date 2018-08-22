<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form method="post" action=<c:url value="/message/ms_sendPost"/>> 
			
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td><input name="you" id="you" size="14" /></td> 
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" id="content" size="50" /></td>
			</tr>

		</table>

		<div id="join_menu" align=center>
			<input type="submit" value="전송" />
			 <input type="reset" value="취소"
				onclick="$('#username').focus();" />
		</div>
	</form>


</body>
</html>