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
                    <th style="width: 120px;">Table</th>
                    <th style="width: 160px;">제목</th>
                    <th style="width: 95px;">읽기P</th>
                    <th style="width: 95px;">쓰기P</th>
                    <th style="width: 95px;">댓글P</th>
                    <th style="width: 95px;">다운로드P</th>
                    <th style="width: 95px;">게시판 읽기 권한</th>
                    <th style="width: 95px;">게시판 쓰기 권한</th>
                    <th style="width: 165px;">등록일</th>
                    <th style="width: 80px;">관리</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${board_list}" var="bo">
                    <tr id="board_item_${bo.no}">
                        <td>${bo.bo_table}</td>
                        <td>${bo.bo_title}</td>
                        <td>${bo.read_p}</td>
                        <td>${bo.write_p}</td>
                        <td>${bo.cm_p}</td>
                        <td>${bo.down_p}</td>
                        <td>${bo.bo_read_role}</td>
                        <td>${bo.bo_write_role}</td>
                        <td>${bo.register_date}</td>
                        <td>
                            <button class="btn btn-primary">수정</button> <button onclick="board_delete('${bo.bo_table}',${bo.no})" class="btn btn-warning">삭제</button>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- /.box-body -->
            <a href="<c:url value="/admin/board_addform" />"  type="button" class="btn bg-olive btn-flat margin">게시판 등록하기</a>
        </div>
    </div>
</section>

<script>

        function board_delete(bo_table,no) {


            if (confirm('정말로 삭제하시겠습니까 ?')) {
                $.ajax({
                    type: 'POST',
                    url: '<c:url value="/admin/board_delete" />',
                    data: {"no":no,"bo_table":bo_table},
                    success: function(result) {

                        if(result == 1) {

                            console.log("삭제 성공");
                            alert("삭제 되었습니다.");

                            $("#board_item_" + no).remove();
                        } else {
                            console.log("삭제 실패");
                        }

                        console.log("결과 ==> " + result);
                    }
                })
            } else {

            }



        }



</script>