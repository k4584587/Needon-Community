<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div class="" style="background-color: white; height:150px;margin-bottom: 10px;">
    구글광고
</div>

<table class="table table-hover" style="margin-top: 10px;">
    <thead style="background-color: white;">
    <tr>
        <th scope="col">번호</th>
        <th scope="col">제목</th>
        <th scope="col">작성자</th>
        <th scope="col">조회수</th>
        <th scope="col">작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${fn:length(list) != 0 }">
            <c:forEach items="${list }" var="list">
                <tr>
                <td>${ list.no }</td>
                <td><a href="<c:url value="/board/view?no=${list.no }" />">${ list.subject }</a></td>
                <td> 작성자</td>
                <td>${ list.read_count }</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ list.register_date }"/></td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5">작성된 글이 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
<button class="btn btn-info" style="float: right;margin-bottom: 10px;">글쓰기</button>