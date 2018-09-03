<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 21.
  Time: PM 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
                   user="admin_project" password="3class"/>


<sql:query dataSource="${datasource}" var="members">
    SELECT
    *
    FROM
    nb_member
    ORDER BY no DESC limit 5
</sql:query>

<sql:query dataSource="${datasource}" var="notice_list">
    select * from nb_board_notice WHERE cm_count = 0 order by no desc limit 5
</sql:query>

<sql:query dataSource="${datasource}" var="member_count">
    SELECT
    count(*) count
    FROM
    nb_member
</sql:query>

<c:forEach items="${member_count.rows}" var="count">
    <c:set var="member_count" value="${count.count}"/>
</c:forEach>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        관리자 메인
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 홈</a></li>
        <li class="active">관리자 메인</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
   <%-- <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>${member_count} 명</h3>

                    <p>전체 회원수</p>
                </div>
                <div class="icon">
                    <i class="fa fa-users" aria-hidden="true"></i>
                </div>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>53<sup style="font-size: 20px">%</sup></h3>

                    <p>오늘 신규 가입회원</p>
                </div>
                <div class="icon">
                    <i class="fa fa-user-plus" aria-hidden="true"></i>
                </div>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3>44</h3>

                    <p>오늘 방문자</p>
                </div>
                <div class="icon">
                    <i class="fa fa-pie-chart" aria-hidden="true"></i>
                </div>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>65</h3>

                    <p>전체 방문자</p>
                </div>
                <div class="icon">
                    <i class="fa fa-globe" aria-hidden="true"></i>
                </div>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->
--%>
    <%--회원목록 시작--%>
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">신규 가입 회원목록</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="member_list" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>회원아이디</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>권한</th>
                    <th>포인트</th>
                    <th>가입일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${members.rows}" var="member">
                    <tr>
                        <td>${member.username}</td>
                        <td>${member.name}</td>
                        <td>${member.nick}</td>
                        <td>${member.role}</td>
                        <td>${member.point}</td>
                        <td>${member.register_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- /.box-body -->
            <a href="<c:url value="/admin/userList" />" style="float: right" type="button" class="btn bg-olive btn-flat margin">회원 전체 보기</a>
        </div>

    </div>
    <!-- /.box -->

    <div class="box">
        <div class="box-header">
            <h3 class="box-title">공지사항</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="notice_list" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${notice_list.rows}" var="notice">
                    <tr>
                        <td><a href="<c:url value="/board/notice/view?category=notice&no=${notice.no}"/>">${notice.subject}</a></td>
                        <td>${notice.wr_nick}</td>
                        <td>${notice.register_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- /.box-body -->
            <a href="<c:url value="/board/notice/list?page=1" />" style="float: right" type="button" class="btn bg-olive btn-flat margin">공지사항 전체글 보기</a>
        </div>

    </div>
    <!-- /.box -->

</section>
<!-- /.content -->

<script>
    $(function () {
        $('#member_list').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })
</script>