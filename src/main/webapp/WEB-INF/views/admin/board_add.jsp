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
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        게시판 등록
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 게시판 등록</a></li>
        <li class="active">게시판 등록</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="box box-warning">
        <div class="box-header with-border">
            <h3 class="box-title">게시판 등록</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <form role="form" action="<c:url value="/admin/board_addpost" />" method="post">
                <!-- text input -->
                <div class="form-group">
                    <label>게시판 테이블 이름</label>
                    <input name="bo_table" style="width: 150px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>게시판 타이틀 제목</label>
                    <input name="bo_title" style="width: 200px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>게시판 설명</label>
                    <input name="bo_info" style="width: 220px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>게시판 관리자</label>
                    <input name="bo_admin" style="width: 200px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>카테고리 사용 여부</label>
                    <select name="bo_category_count" style="width: 200px;" class="form-control">
                        <option value="0">사용안함</option>
                        <option value="1">사용함</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>게시판 카테고리</label>
                    <input name="bo_category" style="width: 220px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>읽기 포인트</label>
                    <input name="read_p" style="width: 50px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>쓰기 포인트</label>
                    <input name="wirte_p" style="width: 50px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>댓글 포인트</label>
                    <input name="cm_p" style="width: 50px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>다운 포인트</label>
                    <input name="down_p" style="width: 50px;" type="text" class="form-control">
                </div>
                <div class="form-group">
                    <label>게시판 글쓰기 권한</label>
                    <select name="bo_read_role" style="width: 200px;" class="form-control">
                        <option value="role_user">사용자</option>
                        <option value="role_admin">관리자</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>게시판 글쓰기 권한</label>
                    <select name="bo_write_role" style="width: 200px;" class="form-control">
                        <option value="role_user">사용자</option>
                        <option value="role_admin">관리자</option>
                    </select>
                </div>
                <button class="btn btn-success">등록하기</button>
            </form>
        </div>
        <!-- /.box-body -->
    </div>
</section>