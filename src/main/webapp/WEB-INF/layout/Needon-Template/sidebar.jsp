<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div style="margin-top: 10px;">
    <sec:authorize access="!isAuthenticated()">
        <div class="card">
            <div class="card-body">
                <div onclick="location.href='<c:url value="/user/login" />'" style="cursor: pointer;background-color: #00a7d0; height: 37px; color: white;text-align: center;padding-top: 10px;margin-bottom: 10px;">
                  <b>니드온 로그인</b>
                </div>
                <div>
                    <span><a href="<c:url value="/user/login#join" />">비밀번호 찾기</a></span>
                </div>
            </div>
        </div>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <sec:authentication property="principal" var="user"/>
        <!-- 여기서부턴 로그인 됨 { -->
        <div class="card">
            <div class="card-body">
                <div class="row" style="margin-bottom: 10px;">
                    <div class="col-auto" style="padding-right: 0px!important;">
                            <%--회원가입 구현되면 여기는 프로필 사진이 오는곳으로 수정바람--%>
                        <c:choose>
                            <c:when test="${username.profile eq null}">
                                            <%--프로필 사진이 등록안될때--%>
                                        <img style="background-size: cover;margin-bottom: 10px;" width="70" class="rounded" src="<c:url value="/resources/img/profile_img.png" />">
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <img style="background-size: cover" width="70" class="rounded"
                                         src="<c:url value="/file/profile.png?username=${user.username}" />">
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-auto">
                        <div>${user.nick} 님 <a href="<c:url value="/user/myinfo"/>">내정보</a></div>
                        <div><a href="#"><b>${user.point} 포인트</b>&nbsp;&nbsp;<b>내 블로그</b></a> <a
                                href="<c:url value="/message/ms_list" />"><b>쪽지(0)</b></a></div>
                    </div>
                </div>
                <form id="logout-form" action="<c:url value="/logout" />" method="post" style="margin-bottom: 10px;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button id="btn-logout" type="submit" class="btn btn-primary btn-block">로그아웃</button>
                </form>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <a href="<c:url value="/admin/" />" class="btn btn-danger btn-block" style="color: white">관리자</a>
                </sec:authorize>
            </div>
        </div>
        <!-- 로그인 됨 끝 } -->
    </sec:authorize>


    <!-- 반응형 광고(1) -->
    <ins class="adsbygoogle"
         style="margin-top: 10px; display:block"
         data-ad-client="ca-pub-9442764132014732"
         data-ad-slot="1288679214"
         data-ad-format="auto"
         data-full-width-responsive="true"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>

</div>