<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 22.
  Time: PM 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        게시판 관리
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 게시판 관리</a></li>
        <li class="active">게시판 관리</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">생성된 게시판 목록</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="member_list" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>Table</th>
                    <th>제목</th>
                    <th>읽기P</th>
                    <th>쓰기P</th>
                    <th>댓글P</th>
                    <th>관리</th>
                </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                    </tr>

                </tbody>
            </table>
            <!-- /.box-body -->
            <a href="<c:url value="/admin/userList" />" style="float: right" type="button" class="btn bg-olive btn-flat margin">회원 전체 보기</a>
        </div>
</section>