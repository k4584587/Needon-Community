<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: k4584587
  Date: 2018. 8. 13.
  Time: PM 3:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script
            src="//code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
</head>
<body>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script
        src="//code.jquery.com/jquery-3.3.1.js"
        integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

${sub_list}
<br><br>
${menu_list}

<table id="category">
    <thead>
    <th>메뉴명</th>
    <th>링크</th>
    <th>새창</th>
    <th>순서</th>
    <th>관리</th>
    </thead>
    <c:forEach items="${menu_list}" var="category">
        <tbody id="${category.id}_category">
        <th><input type="text" value="${category.category_name}"></th>
        <th><input type="text" value="${category.category_link}"></th>
        <th><select>
            <option>
                사용함
            </option>
            <option>
                사용안함
            </option>
        </select></th>
        <th><input type="text"></th>
        <th>
            <button onclick="category_add(${category.id})">추가</button>
            <button>삭제</button>
        </th>
        </tbody>
        <c:if test="${category.sub_category_count eq 1}">
            <c:forEach items="${sub_list}" var="sub">
                <c:if test="${sub.main_category_id == category.id}">
                    <tbody id="${sub.main_category_id}_sub_category">
                    <tr>
                        <th>ㄴ<input type="text" value="${sub.category_name}"></th>
                        <th><input type="text" value="${sub.category_link}"></th>
                        <th><select>
                            <option>
                                사용함
                            </option>
                            <option>
                                사용안함
                            </option>
                        </select></th>
                        <th><input type="text"></th>
                        <th>
                            <button>삭제</button>
                        </th>
                    </tr>
                    </tbody>
                </c:if>
            </c:forEach>
        </c:if>
    </c:forEach>
</table>


<div id="test"></div>
<script>

    $('#category > tbody:last').css( "background-color", "red" );

    function category_add(category_id) {
        console.log("category add click");

        var sub_category = "<tbody id=\"1_sub_category\">\n" +
            "<form>" +
            "    <tr><th>ㄴ<input type=\"text\"></th>\n" +
            "        <th><input type=\"text\"></th>\n" +
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
            "            <button>삭제</button>\n" +
            "            <button>등록</button>\n" +
            "        </th>\n" +
            "    </tr>\n" +
            "    </form>" +
            "</tbody>";

        $("#category > #" + category_id + "_category").after(sub_category);
    }

    function category_insert(){

        var new_category_date = $("#new_menu_form").serializeObject();

        console.log("new_menu_form result ==> " + new_category_date);

        $.ajax({


            type: "POST",
            url: "<c:url value='/sample/menu_add' />",
            data: new_category_date,
            success: function(result) {
                console.log("new_menu_form ajax result ==> " + result);

                console.log("category name ==> " + new_category_date.category_name);

                var list_add_html = "<tbody id=\"7_category\">\n" +
                    "        <tr><th><input type=\"text\" value=\""+new_category_date.category_name+"\"></th>\n" +
                    "        <th><input type=\"text\" value=\""+new_category_date.category_link+"\"></th>\n" +
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
                    "            <button onclick=\"category_add(7)\">추가</button>\n" +
                    "            <button>삭제</button>\n" +
                    "        </th>\n" +
                    "        </tr></tbody>";

                $('#category > tbody:last').after(list_add_html);
                $('#new_menu').modal('hide');
            }
        });
    }

    jQuery.fn.serializeObject = function() {
        var obj = null;
        try {
            if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                var arr = this.serializeArray();
                if (arr) {
                    obj = {};
                    jQuery.each(arr, function() {
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
<button data-toggle="modal" data-target="#new_menu">메뉴 등록</button>

<!-- Modal -->
<div class="modal fade" id="new_menu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form class="modal-content" method="post"  id="new_menu_form">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">메뉴 등록</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-3" style="margin-bottom: 20px!important;">
                        메뉴명
                    </div>
                    <div class="col-auto">
                        <input type="text" name="category_name" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-3" style="margin-bottom: 20px!important;">
                        링크
                    </div>
                    <div class="col-auto">
                        <input type="text" name="category_link" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-3" style="margin-bottom: 20px!important;">
                        순서
                    </div>
                    <div class="col-auto">
                        <input type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-3" style="margin-bottom: 20px!important;">
                        새창 사용
                    </div>
                    <div class="col-auto">
                        <select class="form-control" name="new_tab_count">
                            <option value="1">
                                사용함
                            </option>
                            <option value="0">
                                사용안함
                            </option>
                        </select>
                    </div>
                </div>
                <input type="hidden" name="main_count" value="1">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="category_insert()">등록</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
