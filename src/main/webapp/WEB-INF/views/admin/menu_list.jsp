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

    function category_add(category_id) {
        console.log("category add click");

        var sub_category = "<tbody id=\"" + category_id + "_sub_category\">\n" +
            "    <th>ㄴ<input type=\"text\"></th>\n" +
            "    <th><input type=\"text\"></th>\n" +
            "    <th><select>\n" +
            "        <option>\n" +
            "            사용함\n" +
            "        </option>\n" +
            "        <option>\n" +
            "            사용안함\n" +
            "        </option>\n" +
            "    </select></th>\n" +
            "    <th><input type=\"text\"></th>\n" +
            "    <th>\n" +
            "        <button>삭제</button>\n" +
            "    </th>\n" +
            "    </tbody>";

        $("#category > #" + category_id + "_category").after(sub_category);

    }
</script>

</body>
</html>
