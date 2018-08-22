<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
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

<button onClick="ms_send()">글쓰기</button>

${list }
<table border="1">
		<tr>
			<th scope="col">발신자</th>
			<th scope="col">내용</th>
			<th scope="col">check</th>
			<th scope="col">발신일</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list) != 0 }">
				<c:forEach items="${list }" var="msg" varStatus="status">
			<tr>
				<td>${msg.recv_nick }</td>
				
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
				
				<td>${msg.read_count}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ msg.send_date }" /></td>
			</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colsapn="4">수신 메세지가 없습니다</td>
			</c:otherwise>
		</c:choose>
</table>
</body>
</html>