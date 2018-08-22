<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

${ms }

<form > 
			
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td>${ms.you }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${ms.content }</td>
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