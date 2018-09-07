<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="user"/>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
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
		<div class="col-auto">${user.nick} 님의 쪽지 보내기</div>
	</div>
	<div class="row" style="background-color: black;">
		<div class="col p-2" style="color: white;text-align: center;"><a href="<c:url value="/message/ms_list" />" class="send_link">받은 쪽지함</a></div><div class="col p-2" style="color: white;text-align: center"><a href="<c:url value="/message/send_list" />" class="send_link">보낸 쪽지함</a></div><div class="col p-2" style="color: white;text-align: center"><a class="send_link" onClick="ms_send()" href="#">쪽지 쓰기</a></div>
	</div>
	<div class="p-3">
		<form method="post" action=<c:url value="/message/ms_sendPost"/>>
			<input style="margin-bottom: 10px;" type="text" class="form-control" name="you" placeholder="받는 회원">
			<textarea name="content" style="width: 100%;height: 250px;margin-bottom: 10px;"  class="form-control"></textarea>
			<input class="btn btn-success btn-sm" type="submit" value="전송" />
			<input class="btn btn-secondary btn-sm" type="reset" value="취소" onclick="$('#username').focus();" />
		</form>
	</div>

</div>
<%--
<form method="post" action=<c:url value="/message/ms_sendPost"/>>
			
		<table border=1 align=center>
			<tr>
				<th>아이디</th>
				<td><input name="you" id="you" size="14" required = "required"/></td> 
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" id="content" size="50"  required = "required"/></td>
			</tr>

		</table>

		<div id="join_menu" align=center>
			<input type="submit" value="전송" />
			 <input type="reset" value="취소"
				onclick="$('#username').focus();" />
		</div>
	</form>
--%>


</body>
</html>