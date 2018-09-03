<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 슬라이드 끝 } -->
<div class="col">
    <div class="" style="margin-bottom: 10px;">

        <style>
            .myAd1290 {
                max-width: 765px !important;
                width: 765px;
            }
        </style>

        <!-- 반응형 광고(1) -->
        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
        <center>
            <ins class="adsbygoogle myAd1290"
                 style="display:block"
                 data-ad-client="ca-pub-9442764132014732"
                 data-ad-slot="1288679214"

                 data-ad-format="auto"></ins>
        </center>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>


    </div>

    <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">

            <a class="nav-item nav-link active" id="nav-game-tab" data-toggle="tab" href="#nav-game" role="tab" aria-controls="nav-game" aria-selected="false">
                <div style="text-align: center;"><i class="fas fa-gamepad"></i></div>
                <div style="text-align: center;">게임</div>
            </a>
            <a class="nav-item nav-link" id="nav-pc-tab" data-toggle="tab" href="#nav-pc" role="tab" aria-controls="nav-pc" aria-selected="true">
                <div style="text-align: center;"><i class="fas fa-desktop"></i></div>
                <div style="text-align: center;">PC</div>
            </a>
            <a class="nav-item nav-link" id="nav-smartphone-tab" data-toggle="tab" href="#nav-smartphone" role="tab" aria-controls="nav-smartphone" aria-selected="false">
                <div style="text-align: center;"><i class="fas fa-mobile-alt"></i></div>
                <div style="text-align: center;">스마트폰</div>
            </a>
        </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">

        <div class="tab-pane fade show active" id="nav-game" role="tabpanel" aria-labelledby="nav-game-tab">
            <div class="lat">
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(game_news) != 0 }">
                            <c:forEach items="${game_news}" var="news" varStatus="status">
                                <c:if test="${status.count eq 1}">
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div class="col-auto" style="padding-right: 0px!important;">
                                            <div><img width="125" src="${news.img_src}" ></div>
                                        </div>
                                        <div class="col-auto">
                                            <div><b style="font-size: 15px;"><a href="/board/view?category=${news.category}&no=${news.no}">${news.subject}</a></b></div>
                                            <div style="width: 625px;"><a href="/board/view?category=${news.category}&no=${news.no}"><c:out value='${fn:substring(news.content.replaceAll("\\\<.*?\\\>",""),0, 150)}' />...</a></div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${new_game}" var="list" varStatus="status">
                                <li> <span class="badge badge-primary">
                                    <c:if test="${list.category eq 'xbox_info'}">
                                        xbox
                                    </c:if>
                                    <c:if test="${list.category eq 'switch_info'}">
                                        스위치
                                    </c:if>
                                    <c:if test="${list.category eq 'ps4_info'}">
                                        PS4
                                    </c:if>
                                    <c:if test="${list.category eq 'online_game'}">
                                        온라인 게임
                                    </c:if>
                                </span>
                                    <c:choose>
                                        <c:when test="${fn:length(list.subject) > 100 }">
                                            <a href="<c:url value="/board/view?no=${list.no }&category=${list.category}" />">
                                                <c:out value="${fn:substring(list.subject,0,90) }"></c:out>....
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${list.no }&category=${list.category}'/>"> ${list.subject}</a>
                                        </c:otherwise>
                                    </c:choose> <span style="color: red;">[${list.comment_count}]</span>
                                    <span style="float: right;">
                                    <fmt:formatDate pattern="MM-dd" value="${list.register_date}"/>
                                    </span>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-pc" role="tabpanel" aria-labelledby="nav-pc-tab">
            <div class="lat">
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_pc) != 0 }">
                            <c:forEach items="${new_pc}" var="new_pc" varStatus="status">
                                <c:if test="${status.count eq 1}">
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div class="col-auto" style="padding-right: 0px!important;">
                                            <div><img width="125" src="${new_pc.img_src}" ></div>
                                        </div>
                                        <div class="col-auto">
                                            <div><b style="font-size: 15px;"><a href="/board/view?category=${new_pc.category}&no=${new_pc.no}">${new_pc.subject}</a></b></div>
                                            <div style="width: 625px;"><a href="/board/view?category=${new_pc.category}&no=${new_pc.no}"><c:out value='${fn:substring(new_pc.content.replaceAll("\\\<.*?\\\>",""),0, 150)}' />...</a></div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${new_pc}" var="new_pc" varStatus="status">
                                <li> <span class="badge badge-primary">${new_pc.category}</span>

                                    <c:choose>
                                        <c:when test="${fn:length(new_pc.subject) > 100 }">
                                            <a href="<c:url value="/board/view?no=${new_pc.no }&category=freeboard" />">
                                                <c:out value="${fn:substring(new_pc.subject,0,90) }"></c:out>....
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${new_pc.no }&category=freeboard'/>"> ${new_pc.subject}</a>
                                        </c:otherwise>
                                    </c:choose> <span style="color: red;">[${new_pc.comment_count}]</span>
                                    <span style="float: right;">
                                    <fmt:formatDate pattern="MM-dd" value="${new_pc.register_date}"/>
                                    </span>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
        <div class="tab-pane fade" id="nav-smartphone" role="tabpanel" aria-labelledby="nav-smartphone-tab">
            <div class="lat">
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_pc) != 0 }">
                            <c:forEach items="${new_pc}" var="new_pc" varStatus="status">
                                <c:if test="${status.count eq 1}">
                                    <div class="row" style="margin-bottom: 10px;">
                                        <div class="col-auto" style="padding-right: 0px!important;">
                                            <div><img width="125" src="${new_pc.img_src}" ></div>
                                        </div>
                                        <div class="col-auto">
                                            <div><b style="font-size: 15px;"><a href="/board/view?category=${new_pc.category}&no=${new_pc.no}">${new_pc.subject}</a></b></div>
                                            <div style="width: 625px;"><a href="/board/view?category=${new_pc.category}&no=${new_pc.no}"><c:out value='${fn:substring(new_pc.content.replaceAll("\\\<.*?\\\>",""),0, 150)}' />...</a></div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>

                            <c:forEach items="${new_pc}" var="new_pc" varStatus="status">
                                <li> <span class="badge badge-primary">${new_pc.category}</span>

                                    <c:choose>
                                        <c:when test="${fn:length(new_pc.subject) > 100 }">
                                            <a href="<c:url value="/board/view?no=${new_pc.no }&category=freeboard" />">
                                                <c:out value="${fn:substring(new_pc.subject,0,90) }"></c:out>....
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${new_pc.no }&category=${new_pc.category}'/>"> ${new_pc.subject}</a>
                                        </c:otherwise>
                                    </c:choose> <span style="color: red;">[${new_pc.comment_count}]</span>
                                    <span style="float: right;">
                                    <fmt:formatDate pattern="MM-dd" value="${new_pc.register_date}"/>
                                    </span>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>

    </div>

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
                                    <a href="<c:url value='/board/view?no=${notice.no }&category=notice'/>"> ${notice.subject}</a>
                                </c:otherwise>
                            </c:choose> <span style="color: red;">[${notice.comment_count}]</span>
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
            <a href="<c:url value="/board/notice/list?page=1" />" class="lt_more"><i class="fas fa-plus"></i></a>
        </ul>
    </div>
    <!-- 공지 끝 -->



    <div class="row">
        <!-- 최신글 시작 { -->
        <div class="col-6" style="padding-right: 0; margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/freeboard/list?page=1" />">자유게시판</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_freeboard) != 0 }">
                            <c:forEach items="${new_freeboard}" var="freeboard" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(freeboard.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${freeboard.no }&category=freeboard" />">
                                                <c:out value="${fn:substring(freeboard.subject,0,10) }"></c:out>....
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${freeboard.no }&category=freeboard'/>"> ${freeboard.subject}</a>
                                        </c:otherwise>
                                    </c:choose> <span style="color: red;">[${freeboard.comment_count}]</span>
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
                    <a href="<c:url value="/board/freeboard/list?page=1" />" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
        <!-- 최신글 시작 -->
        <div class="col-6" style="margin-bottom: 10px;">
            <div class="lat">
                <h2 class="lat_title"><a href="<c:url value="/board/fun/list?page=1" />">유머게시판</a></h2>
                <ul>
                    <c:choose>
                        <c:when test="${fn:length(new_fun) != 0 }">
                            <c:forEach items="${new_fun}" var="fun" varStatus="status">
                                <li>
                                    <c:choose>
                                        <c:when test="${fn:length(fun.subject) > 11 }">
                                            <a href="<c:url value="/board/view?no=${fun.no }&category=${fun.category}" />">
                                                <c:out value="${fn:substring(freeboard.subject,0,10) }"></c:out>....
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/board/view?no=${fun.no }&category=${fun.category}'/>"> ${fun.subject}</a>
                                        </c:otherwise>
                                    </c:choose> <span style="color: red;">[${fun.comment_count}]</span>
                                    <span style="color: red;">New</span>
                                    <span style="float: right;">
                                    <fmt:formatDate pattern="MM-dd" value="${fun.register_date}"/>
                                    </span>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <li>작성된 글이 없습니다.</li>
                        </c:otherwise>
                    </c:choose>
                    <a href="<c:url value="/board/fun/list?page=1" />" class="lt_more"><i class="fas fa-plus"></i></a>
                </ul>
            </div>
        </div>
        <!-- 최신글 끝 -->
    </div>

    <div class="lat_photo" style="padding-bottom: 10px;">
        <h2 class="lat_title"><a href="<c:url value="/board/comic/list?page=1" />">만화</a></h2>
        <ul>
            <c:choose>
                <c:when test="${fn:length(new_comic) != 0 }">
                    <c:forEach items="${new_comic}" var="comic" varStatus="status">
                        <li>
                                <c:choose>
                                    <c:when test="${comic.img_src eq ''}">
                                        <a href="#"><img src="//via.placeholder.com/128"></a>
                                    </c:when>
                                    <c:otherwise>
                                        <div><a href="<c:url value="/board/view?category=comic&no=${comic.no}" />"><img width="128" src="${comic.img_src}"></a></div>
                                        <div><a href="<c:url value="/board/view?category=comic&no=${comic.no}" />">${comic.subject}</a></div>
                                    </c:otherwise>
                                </c:choose>

                        </li>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <li>작성된 글이 없습니다.</li>
                </c:otherwise>
            </c:choose>
            <a href="<c:url value="/board/notice/list?page=1" />" class="lt_more"><i class="fas fa-plus"></i></a>
        </ul>
    </div>
</div>