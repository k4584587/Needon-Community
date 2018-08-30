<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 30.
  Time: AM 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>
<style>

    .main_profile {
        margin-bottom: 10px;
    }

    .blog .category {
        margin-bottom: 5px;
    }

    .blog .subject {
        font-size: 15px;
        font-weight: 600;
    }

    .blog .content {
        color: #666;
    }

    .blog .profile {
        margin-bottom: 10px;
    }
</style>

<div style="margin-left: 10px;" class="blog">
    <div class="main_profile" style="margin-bottom: 0px!important;">
        <div class="row">
            <div class="col" style="padding-left: 0px;padding-right: 0px">
                <div class="jumbotron" style="margin-bottom: 10px;margin-left: 15px">
                    <h4>
                        <c:choose>
                            <c:when test="${blog_info.blog_title eq null}">
                                ${user.nick} 님의 블로그
                            </c:when>
                            <c:otherwise>
                                ${blog_info.blog_title}
                            </c:otherwise>
                        </c:choose>
                    </h4>
                    <span>팔로우 ${user.follow}명</span> <span>구독 0명</span>
                    <div style="margin-top: 5px"><button class="btn btn-danger btn-sm">관리</button></div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <textarea class="form-control" style="margin-bottom: 10px;">test</textarea>
    </div>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb" style="background-color: #d4d4d4!important;">
            <li class="breadcrumb-item active" aria-current="page">잡담</li>
            <li class="breadcrumb-item active" aria-current="page">리뷰</li>
            <li class="breadcrumb-item active" aria-current="page">IT</li>
            <li class="breadcrumb-item active" aria-current="page">게임</li>
        </ol>
    </nav>
    <div class="row" style="background-color: white;margin-left: 0px;margin-right: 0px;">
        <div class="col-8 p-3">
            <div class="profile">
                10분전
            </div>
            <div class="category">
                <a href="#">잡담</a>
            </div>
            <div class="subject" style="margin-bottom: 10px;">
                <a href="#" data-toggle="modal" data-target="#exampleModalCenter">제목제목제목제목제목제목제목제목제목제목제목제목제목제목</a>
            </div>
            <div class="content">
                <a href="#" data-toggle="modal" data-target="#exampleModalCenter">
                    내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
                    내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
                </a>
            </div>
            <div style="margin-top: 10px;color: #959595"><span>공감 10</span> <span>댓글 10</span></div>
        </div>
        <div class="col p-3" style="text-align: right">
           <img src="https://via.placeholder.com/165">
        </div>
    </div>
    <hr>
</div>

<!-- Post View Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">제목....</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="conatiner">
                    test
                </div>
            </div>
        </div>
    </div>
</div>