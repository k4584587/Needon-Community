<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 슬라이드 끝 } -->
<div class="col">
    <div class="" style="background-color: white; height:150px;margin-bottom: 10px;">
        구글광고
    </div>

    <div class="row">
        <!-- 최신글 시작 { -->
        <div class="col-6" style="padding-right: 0; margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/notice/list?page=1" />">공지사항</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_notice) != 0 }">
                            <c:forEach items="${new_notice}" var="notice" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(notice.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${notice.no }&category=notice" />"> <c:out value="${fn:substring(notice.subject,0,10) }"></c:out>....</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${notice.no }&category=freeboard'/>"> ${notice.subject}</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                            <fmt:formatDate pattern="MM-dd" value="${notice.register_date}"/>
                        </span>

                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="https://secgy.scnu.ac.kr/secgy/bbs/board.php?bo_table=simhwa_repot" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
        <!-- 최신글 시작 -->
        <div class="col-6" style="margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/freeboard/list?page=1" />">자유게시판</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_freeboard) != 0 }">
                            <c:forEach items="${new_freeboard}" var="freeboard" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(freeboard.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${freeboard.no }&category=notice" />"> <c:out value="${fn:substring(freeboard.subject,0,10) }"></c:out>....</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${freeboard.no }&category=freeboard'/>"> ${freeboard.subject}</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                            <fmt:formatDate pattern="MM-dd" value="${freeboard.register_date}"/>
                        </span>

                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="https://secgy.scnu.ac.kr/secgy/bbs/board.php?bo_table=simhwa_repot" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
    </div>
    <div class="row">
        <!-- 최신글 시작 { -->
        <div class="col-6" style="padding-right: 0; margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/notice/list?page=1" />">공지사항</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_notice) != 0 }">
                            <c:forEach items="${new_notice}" var="notice" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(notice.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${notice.no }&category=notice" />"> <c:out value="${fn:substring(notice.subject,0,10) }"></c:out>....</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${notice.no }&category=freeboard'/>"> ${notice.subject}</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                            <fmt:formatDate pattern="MM-dd" value="${notice.register_date}"/>
                        </span>

                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="https://secgy.scnu.ac.kr/secgy/bbs/board.php?bo_table=simhwa_repot" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
        <!-- 최신글 시작 -->
        <div class="col-6" style="margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/freeboard/list?page=1" />">자유게시판</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_freeboard) != 0 }">
                            <c:forEach items="${new_freeboard}" var="freeboard" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(freeboard.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${freeboard.no }&category=notice" />"> <c:out value="${fn:substring(freeboard.subject,0,10) }"></c:out>....</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${freeboard.no }&category=freeboard'/>"> ${freeboard.subject}</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                            <fmt:formatDate pattern="MM-dd" value="${freeboard.register_date}"/>
                        </span>

                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="https://secgy.scnu.ac.kr/secgy/bbs/board.php?bo_table=simhwa_repot" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
    </div>
    <div class="row">
        <!-- 최신글 시작 { -->
        <div class="col-6" style="padding-right: 0; margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/notice/list?page=1" />">공지사항</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_notice) != 0 }">
                            <c:forEach items="${new_notice}" var="notice" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(notice.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${notice.no }&category=notice" />"> <c:out value="${fn:substring(notice.subject,0,10) }"></c:out>....</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${notice.no }&category=freeboard'/>"> ${notice.subject}</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                            <fmt:formatDate pattern="MM-dd" value="${notice.register_date}"/>
                        </span>

                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="https://secgy.scnu.ac.kr/secgy/bbs/board.php?bo_table=simhwa_repot" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
        <!-- 최신글 시작 -->
        <div class="col-6" style="margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/freeboard/list?page=1" />">자유게시판</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_freeboard) != 0 }">
                            <c:forEach items="${new_freeboard}" var="freeboard" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(freeboard.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${freeboard.no }&category=notice" />"> <c:out value="${fn:substring(freeboard.subject,0,10) }"></c:out>....</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${freeboard.no }&category=freeboard'/>"> ${freeboard.subject}</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                            <fmt:formatDate pattern="MM-dd" value="${freeboard.register_date}"/>
                        </span>

                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="https://secgy.scnu.ac.kr/secgy/bbs/board.php?bo_table=simhwa_repot" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
    </div>
</div>