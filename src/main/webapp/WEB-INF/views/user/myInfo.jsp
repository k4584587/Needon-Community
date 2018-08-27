<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>

<div class="col">
    <div class="" style="margin-bottom: 10px;">
        <table boder="1" align=center>
            <tr>
                <th>아이디</th>
                <td>${user.username}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td>${user.name}</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>${user.nick}</td>
            </tr>
            <tr>
                <th>핸드폰</th>
                <td>${user.phone}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${user.birth}</td>
            </tr>
            <tr>
                <th>성별</th>
                <td>${user.sex}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${user.email}</td>
            </tr>
            <tr>
                <th>주소</th>
                <td colspan=2>${user.address1}
                    ${user.address2}
                </td>
            </tr>
            <tr>
                <th>프로필</th>
                <td>${user.profile}</td>
            </tr>

            <tr>
                <td rowspan=2><a href="<c:url value="/user/myinfo_check"/>">수정</a>
                    <a href="<c:url value="/"/>">홈</a></td>
            </tr>

        </table>
    </div>
</div>