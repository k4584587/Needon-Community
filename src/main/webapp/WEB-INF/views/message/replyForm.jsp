<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

 <script>
  function ms_close(){
		 window.close();
  }
</script>

${data }

<form action="<c:url value="/message/reply"/>" method="post" >
	<input type="hidden"  name="username" value="${data}" > 
			
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td>${data}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" id="content" size="50"  required = "required"/></td>
			</tr>

		</table>

		<div id="join_menu" align=center>
		
		
		
			<input type="submit" value="전송" />
			<button onClick="ms_close()">취소</button>
		</div>
	</form>

</body>
</html>