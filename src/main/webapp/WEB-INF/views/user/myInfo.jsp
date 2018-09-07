<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>
<div style="margin-left: 10px;">
    <div class="p-3">
      <center>
            <div class="col" style="border: 1px solid #dee3eb;background-color: white;margin-bottom: 10px;">
                <div class="p-4">
                    <h5 style="margin-bottom: 10px;">회원정보</h5>
                    <div class="row">
                        <div class="col-auto">
                            <img src="<c:url value="/resources/img/profile_img.png" />">
                        </div>
                        <div class="col" style="text-align: left;">
                            <div style="margin-bottom: 5px;font-size: 15px;"><b>회원님의 개인정보를 수정합니다!</b></div>
                            <div style="font-size: 15px;margin-bottom: 5px;">아이디 : ${user.username}</div>
                            <div style="font-size: 15px;margin-bottom: 5px;">이름 : ${user.name}</div>
                            <div style="font-size: 15px;margin-bottom: 5px;">닉네임 : ${user.nick}</div>
                            <div style="font-size: 15px;margin-bottom: 5px;">이메일 : ${user.email}</div>
                            <div style="font-size: 15px;margin-bottom: 5px;">전화번호 : ${user.phone}</div>
                        </div>
                    </div>
                </div>
            </div>
          <button class="btn btn-success btn-sm" onclick="location.href='<c:url value="/user/my_modify" />'">정보수정</button>
           <center>

    </div>

</div>
