<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 26.
  Time: PM 5:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
                   user="admin_project" password="3class"/>

<sql:query dataSource="${datasource}" var="top_menu">
    SELECT
    *
    FROM
    nb_menu_list
    WHERE
    main_count = 1
</sql:query>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        페이지 등록
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 페이지 등록</a></li>
        <li class="active">페이지 등록</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="box box-warning">
        <div class="box-header with-border">
            <h3 class="box-title">페이지 등록</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <form role="form" action="<c:url value="/admin/page_post" />" method="post">
                <!-- text input -->
                <div class="form-group">
                    <label>페이지 테이블 이름</label>
                    <input name="bo_table" style="width: 150px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>페이지 타이틀 제목</label>
                    <input name="bo_title" style="width: 200px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>상위 메뉴</label>
                    <select name="category_no" style="width: 200px;" class="form-control">
                        <c:forEach items="${top_menu.rows}" var="top">
                            <option value="${top.id}">${top.category_name}</option>
                        </c:forEach>
                        <option value="0">없음</option>
                    </select>
                </div>
                <button class="btn btn-success">등록하기</button>
            </form>
        </div>
        <!-- /.box-body -->
    </div>
</section>