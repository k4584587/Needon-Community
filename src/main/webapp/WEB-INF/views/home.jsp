<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page session="false" %> 
<sec:authentication property="principal" var="user" />
${user }test<br>
<br>
${fn:length(new_notice)}
<br>

<br>

<c:forEach items="${new_notice}" var="notice">
    ${freeboard.subject}<br>
</c:forEach>

<!-- 슬라이드 끝 } -->
<div class="col" style="margin-bottom: 400px;">
    <div class="" style="background-color: white; height:150px;margin-bottom: 10px;">
        구글광고
    </div>

    <div class="row">
        <!-- 최신글 시작 { -->
        <div class="col-6" style="padding-right: 0; margin-bottom: 10px;">
            <div class="card">
                <div class="card-header">
                                <span>
                                    <a href="#">게시판 제목</a>
                                </span>
                    <span style="float: right;">
                                    <a href="<c:url value="/board/notice/list"/>">더보기</a>
                                </span>
                </div>
                <ul class="list-group list-group-flush">
                <c:choose>
				<c:when test="${fn:length(new_notice) != 0 }">
                   <c:forEach items="${new_notice}" var="notice">
                    <li class="list-group-item">
                        <span>
                                        <!-- <span class="badge badge-success">베스트</span> -->
                                        <a href="<c:url value='/board/view?no=${notice.no }&category=notice'/>"> 
                                        ${notice.subject}</a>
                                        <span style="color: red;">New</span>
                                        <span style="float: right;">${notice.register_date }</span>
                    </li>
                  </c:forEach>
                  </c:when>
                   <c:otherwise>
                   
							<span class="p-3">작성된 글이 없습니다.</span>
					</c:otherwise>
                  </c:choose>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
        <!-- 최신글 시작 -->
        <div class="col-6" style="margin-bottom: 10px;">
            <div class="card">
                <div class="card-header">
                                <span>
                                    <a href="#">게시판 제목</a>
                                </span>
                    <span style="float: right;">
                                    <a href="<c:url value="/board/freeboard/list"/>">더보기</a>
                                </span>
                </div>
                <ul class="list-group list-group-flush">
                   <c:forEach items="${new_freeboard}" var="freeboard">
                    <li class="list-group-item">
                        <span>
                                        <!-- <span class="badge badge-success">베스트</span> -->
                                        <a href="<c:url value='/board/view?no=${freeboard.no }&category=freeboard'/>"> 
                                        ${freeboard.subject}</a>
                                        <%-- <a href="#"> ${freeboard.subject}</a> --%>
                                        <span style="color: red;">New</span>
                                        <span style="float: right;">${freeboard.register_date }</span>
                    </li>
                  </c:forEach>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
    </div>
</div>