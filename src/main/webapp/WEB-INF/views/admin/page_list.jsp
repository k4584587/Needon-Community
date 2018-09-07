<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
                   user="admin_project" password="3class"/>
<sql:query dataSource="${datasource}" var="page_data">
    SELECT
        *
    FROM
        nb_bopage
    ORDER BY no DESC
</sql:query>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        페이지 관리
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 게시판 관리</a></li>
        <li class="active">페이지 관리</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">생성된 페이지 목록</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="member_list" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th style="width: 120px;">Table</th>
                    <th style="width: 160px;">제목</th>
                    <th style="width: 165px;">등록일</th>
                    <th style="width: 80px;">관리</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page_data.rows}" var="page">
                    <tr id="board_item_${bo.no}">
                        <td>${page.bo_table}</td>
                        <td>${page.bo_title}</td>
                        <td>${page.register_date}</td>
                        <td>
                            <button class="btn btn-primary">수정</button> <button onclick="board_delete('${bo.bo_table}',${bo.no})" class="btn btn-warning">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- /.box-body -->
            <a href="<c:url value="/admin/page_add" />"  type="button" class="btn bg-olive btn-flat margin">페이지 등록하기</a>
        </div>
    </div>
</section>