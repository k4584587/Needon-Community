<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form name="f" method="post" action=<c:url value="/user/userJoin_ok"/> onsubmit="return check()" 
			enctype="multipart/form-data"> 
			
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td><input name="username" id="username" size="14" value=1 /> 
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" id="content" size="50" /></td>
			</tr>

		</table>

		<div id="join_menu" align=center>
			<input type="submit" value="회원가입" />
			 <input type="reset" value="취소"
				onclick="$('#id').focus();" />
		</div>
	</form>


</body>
</html>