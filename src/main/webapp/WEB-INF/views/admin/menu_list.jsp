<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 13.
  Time: PM 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://125.183.115.12/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC"
                   user="admin_project" password="3class"/>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        메뉴 관리
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 메뉴 관리</a></li>
        <li class="active">메뉴 관리</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">생성된 메뉴 목록</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table class="table table-bordered table-hover" id="category">
                <thead>
                <th>메뉴명</th>
                <th>링크</th>
                <th>새창</th>
                <th>순서</th>
                <th>관리</th>
                </thead>
                <c:forEach items="${menu_list}" var="category">
                    <tbody id="${category.id}_category">
                    <th><input class="form-control" type="text" value="${category.category_name}"></th>
                    <th><input class="form-control"  type="text" value="${category.category_link}"></th>
                    <th><select class="form-control"  id="new_tab_count" name="new_tab_count">
                        <option value="0" <c:if test="${category.new_tab_count eq 0}">selected</c:if>>
                            사용안함
                        </option>
                        <option value="1" <c:if test="${category.new_tab_count eq 1}">selected</c:if>>
                            사용함
                        </option>
                    </select></th>
                    <th><input class="form-control" type="text"></th>
                    <th>
                        <button class="btn btn-primary" onclick="sub_category_add(${category.id})">추가</button>
                        <button class="btn btn-warning" onclick="topMenu_delete(${category.id})">삭제</button>
                    </th>
                    </tbody>
                    <c:if test="${category.sub_category_count eq 1}">
                        <c:forEach items="${sub_list}" var="sub">
                            <c:if test="${sub.main_category_id eq category.id}">
                                <tbody id="${sub.main_category_id}_sub_category">
                                <tr>
                                    <th>ㄴ<input class="form-control"  type="text" value="${sub.category_name}"></th>
                                    <th><input class="form-control"  type="text" value="${sub.category_link}"></th>
                                    <th><select class="form-control"  id="sub_new_tab_count" name="new_tab_count">
                                        <option value="0">
                                            사용안함
                                        </option>
                                        <option value="1">
                                            사용함
                                        </option>
                                    </select></th>
                                    <th><input class="form-control"  type="text"></th>
                                    <th>
                                        <button class="btn btn-warning" onclick="subMenu_delete(${sub.main_category_id}, ${sub.id})">삭제</button>
                                    </th>
                                </tr>
                                </tbody>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </table>



            <script>

                function subMenu_delete(div_id, id) {
                    console.log(id + " 번째 삭제를 클릭함");

                    $.ajax({
                        type: 'POST',
                        url: "<c:url value='/sample/top_menu.delete' />",
                        data: {id: id},
                        success: function (result) {
                            console.log("처리결과 ==> " + result);

                            if (result == 1) {
                                console.log("#" + div_id + "_sub_category" + " 삭제됨");
                                $("#" + div_id + "_sub_category").remove();
                                alert("메뉴가 삭제되었습니다.");
                            } else {
                                alert("삭제 실패!");
                            }

                        }
                    });

                }

                function topMenu_delete(id) {

                    console.log(id + " 번째 삭제를 클릭함");

                    $.ajax({
                        type: 'POST',
                        url: "<c:url value='/sample/top_menu.delete' />",
                        data: {id: id},
                        success: function (result) {
                            console.log("처리결과 ==> " + result);

                            if (result == 1) {
                                $("#" + id + "_category").remove();
                                alert("메뉴가 삭제되었습니다.");
                            } else {
                                alert("삭제 실패!");
                            }

                        }
                    });

                }


                function sub_category_add(category_id) {
                    console.log("category add click");

                    var sub_category =
                        "<tbody id=\""+category_id+"_sub_category\">\n" +
                        "<tr>\n" +
                        "    <input type=\"hidden\" id=\"main_category_id\" name=\"main_category_id\" value=\""+category_id+"\">\n" +
                        "    <input type=\"hidden\" id=\"sub_category_count\" name=\"sub_category_count\" value=\"1\">\n" +
                        "    <input type=\"hidden\" id=\"sub_count\" name=\"sub_count\" value=\"1\">\n" +
                        "    <th>ㄴ<input class=\"form-control\" type=\"text\" id=\"category_name\" name=\"category_name\"></th>\n" +
                        "    <th><input  class=\"form-control\" type=\"text\" id=\"category_link\" name=\"category_link\"></th>\n" +
                        "    <th><select class=\"form-control\" id=\"new_tab_count\" name=\"new_tab_count\">\n" +
                        "        <option value=\"0\">사용안함</option>\n" +
                        "        <option value=\"1\">사용함</option>\n" +
                        "    </select></th>\n" +
                        "    <th><input type=\"text\"></th>\n" +
                        "\n" +
                        "    <th>\n" +
                        "        <button disabled>삭제</button>\n" +
                        "        <button id=\"save-btn\" onclick=\"sub_insert("+category_id+")\">등록</button>\n" +
                        "    </th>\n" +
                        "</tr>\n" +
                        "</tbody>\n";

                    $("#category > #" + category_id + "_category").after(sub_category);
                }

                function sub_insert(category_id) {
                    console.log(category_id + "의 서브카테고리 추가 버튼 클릭함");

                    var main_category_id =  $("input[id='main_category_id']").val();
                    var sub_category_count =  $("input[id='sub_category_count']").val();
                    var sub_count =  $("input[id='sub_count']").val();

                    var category_name =  $("input[id='category_name']").val();
                    var category_link =  $("input[id='category_link']").val();
                    var new_tab_count =  $("select[id='new_tab_count']").val();

                    console.log("main_category_id ==> " + main_category_id);
                    console.log("sub_category_count ==> " + sub_category_count);
                    console.log("sub_count ==> " + sub_count);

                    console.log("category_name ==> " + category_name);
                    console.log("category_link ==> " + category_link);
                    console.log("new_tab_count ==> " + new_tab_count);

                    $.ajax({
                        type: "POST",
                        url: "<c:url value="/sample/sub_insert" />",
                        data: {main_category_id:main_category_id, sub_category_count:sub_category_count, sub_count:sub_count,category_name:category_name,category_link:category_link,new_tab_count:new_tab_count},
                        success: function (result) {
                            console.log("result ==> " + result);
                            if(result == 1) {
                                alert("서브 메뉴가 등록되었습니다.");
                                $("#save-btn").remove();
                            } else {
                                alert("서브 메뉴 등록 실패");
                            }
                        }
                    });
                }


                function category_insert(id) {

                    var new_category_date = $("#new_menu_form").serializeObject();

                    console.log("new_menu_form result ==> " + new_category_date);

                    $.ajax({
                        type: "POST",
                        url: "<c:url value='/sample/menu_add' />",
                        data: new_category_date,
                        success: function (result) {
                            if (result == 1) {
                                console.log("new_menu_form ajax result ==> " + result);
                                console.log("category name ==> " + new_category_date.category_name);

                                var list_add_html = "<tbody id=\"" + id + "_category\">\n" +
                                    "        <tr><th><input type=\"text\" value=\"" + new_category_date.category_name + "\"></th>\n" +
                                    "        <th><input type=\"text\" value=\"" + new_category_date.category_link + "\"></th>\n" +
                                    "        <th><select>\n" +
                                    "            <option>\n" +
                                    "                사용함\n" +
                                    "            </option>\n" +
                                    "            <option>\n" +
                                    "                사용안함\n" +
                                    "            </option>\n" +
                                    "        </select></th>\n" +
                                    "        <th><input type=\"text\"></th>\n" +
                                    "        <th>\n" +
                                    "            <button onclick=\"category_add("+id+")\" disabled>추가</button>\n" +
                                    "            <button onclick=\"topMenu_delete(1)\" disabled>삭제</button>\n" +
                                    "        </th>\n" +
                                    "        </tr></tbody>";

                                $('#category > tbody:last').after(list_add_html);
                                $('#new_menu').modal('hide');
                            } else {
                                alert("등록 실패");
                                $('#new_menu').modal('hide');
                            }
                        }


                    });
                }

                jQuery.fn.serializeObject = function () {
                    var obj = null;
                    try {
                        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                            var arr = this.serializeArray();
                            if (arr) {
                                obj = {};
                                jQuery.each(arr, function () {
                                    obj[this.name] = this.value;
                                });
                            }//if ( arr ) {
                        }
                    } catch (e) {
                        alert(e.message);
                    } finally {
                    }

                    return obj;
                };

            </script>

        </div>
    </div>
    <button class="btn btn-primary" data-toggle="modal" data-target="#new_menu">메뉴 등록</button>

</section>
<!-- Modal -->
<div class="modal fade" id="new_menu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form class="modal-content" method="post" id="new_menu_form">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">메뉴 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <input style="margin-bottom: 10px;" type="text" name="category_name" class="form-control" placeholder="메뉴명">

                <input style="margin-bottom: 10px;" type="text" name="category_link" class="form-control" placeholder="메뉴 링크">


                <input style="margin-bottom: 10px;" type="text" class="form-control" placeholder="메뉴 순서">


                새창사용 : <select style="margin-bottom: 10px;"  name="new_tab_count">
                            <option value="0">
                                사용안함
                            </option>
                            <option value="1">
                                사용함
                            </option>
                        </select>
                    <br>


                       서브카테고리 :  <select style="margin-bottom: 10px;"  name="sub_category_count">
                            <option value="0">
                                사용안함
                            </option>
                            <option value="1">
                                사용함
                            </option>
                        </select>


                <input type="hidden" name="main_count" value="1">

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="category_insert(1)">등록</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
            </div>
        </form>
    </div>
</div>

