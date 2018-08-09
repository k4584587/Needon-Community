<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authentication property="principal" var="user"/>
<form action="<c:url value="/board/write" />" method="post">

    <input type="hidden" name="wr_nick" value="${user.nick }"/>
    <input type="hidden" name="wr_password" value="${user.password }"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" name="category" value="${param.category }"/>
    <input type="hidden" name="page" value="${param.page}"/>
    <table align="center" border=1>
        <tr>
            <th>제목</th>
            <td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content"></textarea></td>
        </tr>
        <tr>
            <td align=center colspan="2">
                <input type="submit" value="등록">
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form>