<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="user"/>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>쪽지 리스트</title>
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
<script>
    /*메세지창*/
    function ms_send(){
        window.open("ms_send","메세지 전송","width=400,height=400");
    }
</script>

<script>
    /*메세지창*/
    function ms_view(no){
        window.open("ms_view?no="+no+"","메세지 확인","width=400,height=400");
    }
</script>


<div style="height: 5px;background-color: black;margin-bottom: 10px;"></div>
<div style="margin-left: 5px;">
<div class="row" style="margin-bottom: 10px;">
	<div class="col-auto">
		<img width="65" src="<c:url value="/resources/img/profile_img.png" />">
	</div>
	<div class="col-auto">${user.nick} 님의 쪽지함</div>
</div>
<div class="row" style="background-color: black;">
	<div class="col p-2" style="color: white;text-align: center;"><a href="<c:url value="/message/ms_list" />" class="send_link">받은 쪽지함</a></div><div class="col p-2" style="color: white;text-align: center"><a href="<c:url value="/message/send_list" />" class="send_link">보낸 쪽지함</a></div><div class="col p-2" style="color: white;text-align: center"><a class="send_link" onClick="ms_send()" href="#">쪽지 쓰기</a></div>
</div>
	<table class="table table-striped table-hover">
		<tr>
			<th scope="col">보낸사람</th>
			<th scope="col">내용</th>
			<th scope="col">발신일</th>
			<th scope="col">관리</th>
		</tr>

		<c:choose>
		<c:when test="${fn:length(list) != 0 }">
			<c:forEach items="${list }" var="msg" varStatus="status">
				<tr>
					<td>${msg.send_nick }</td>

					<td style="cursor: pointer" onClick="ms_view(${msg.no})" >

						<c:choose>
							<c:when test="${fn:length(msg.content) > 11 }">
								<c:out value="${fn:substring(msg.content,0,10) }"/>....
							</c:when>

							<c:otherwise>
								<c:out value="${msg.content}"/>
							</c:otherwise>
						</c:choose>

					</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ msg.send_date }" /></td>
					<td><button style="color: white;" class="btn btn-warning btn-sm">삭제</button></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
			<td colsapn="4">수신 메세지가 없습니다</td>
			</c:otherwise>
			</c:choose>
	</table>
	<!-- 페이지 처리 시작  -->
	<c:if test="${pageMaker.ms.page != 1 }">
		<a	 href="<c:url value="/message/ms_list${pageMaker.uri(pageMaker.start)}"/>">&laquo;
			처음</a>
	</c:if>

	<c:if test="${pageMaker.startPage >= 11 }">
		<a href="<c:url value="/message/ms_list${pageMaker.uri(pageMaker.start)}"/>">&lt;
			이전</a>
	</c:if>

	<c:forEach var="a" begin="${pageMaker.startPage }" end="${pageMaker.totalPage }">
		<a href="<c:url value="/message/ms_list${pageMaker.uri(a)}"/>">${a }</a>
	</c:forEach>

	<c:if test="${pageMaker.next  }">
		<a href="<c:url value="/message/ms_list${pageMaker.uri(pageMaker.totalPage + 1)} "/>">다음
			&gt;</a>
		<a href="<c:url value="/message/ms_list${pageMaker.uri(pageMaker.endPage)}"/>">&raquo;
			마지막</a>
	</c:if>
</div>

</body>
</html>