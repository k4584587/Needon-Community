<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="kr.needon.community.Module.SampleExample.SampleExampleDAOImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
                   url="jdbc:log4jdbc:mysql://13.125.208.101/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC&useSSL=false&autoReconnectForPools=true&autoReconnection=true&testWhileIdle=false"
                   user="admin_project" password="3class"/>

<sql:query dataSource="${datasource}" var="top_menu">
    SELECT
    *
    FROM
    nb_menu_list
    WHERE
    main_count = 1
</sql:query>

<sql:query dataSource="${datasource}" var="sub_menu">
    SELECT
    *
    FROM
    nb_menu_list
    WHERE
    sub_count = 1
    ORDER BY FIELD(menu_id,menu_id);
</sql:query>

<!-- 메뉴비 사직 -->
<nav class="navbar navbar-expand navbar-dark blue-theme" style="height: 50px;">
    <div class="container">
        <div class="navbar-collapse collapse">
            <ul class="navbar-nav mr-auto">
                <c:forEach items="${top_menu.rows}" var="top" varStatus="status">
                    <c:choose>
                        <c:when test="${top.sub_category_count eq 1}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${top.category_name}</a>
                                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                                            <c:forEach items="${sub_menu.rows}" var="sub_down">
                                                <c:if test="${sub_down.main_category_id eq top.id}">
                                                    <a class="dropdown-item" href="<c:url value="${sub_down.category_link}" />">${sub_down.category_name}</a>
                                                </c:if>
                                        </c:forEach>
                                    </div>
                                </li>

                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link"
                                                    href="<c:url value="${top.category_link}" />">${top.category_name}</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </ul>
            <form class="form-inline my-2 my-md-0" action=<c:url value="/search/view" /> method="get">
                <input class="form-control" type="text" placeholder="검색" name="keyword"
                       aria-label="Search">
               <%--<input type="submit" value="검색">--%>
            </form>
        </div>
    </div>
</nav>
