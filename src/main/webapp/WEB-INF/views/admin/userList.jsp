<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<h3 class="box-title">회원 리스트</h3>
		</div>
		<!-- /.box-header -->
		<div class="box-body">
			유저 수 : ${listcount }
			<table class="table table-bordered table-hover" border=1 align=center >
				<tr>
					<td>회원번호</td>
					<td>id</td>
					<td>이름</td>
					<td>닉네임</td>
					<td>핸드폰</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>이메일</td>
					<td>주소1</td>
					<td>주소2</td>
					<td>포인트</td>
					<td>팔로워</td>
					<td>레벨</td>
					<td>exp</td>
					<td>메일확인여부</td>
					<td>메세지확인여부</td>
					<td>가입일</td>
					<td>마지막로그인</td>
					<td>활성화</td>
					<td>권한</td>
					<td>관리</td>
				</tr>

				<!-- 화면 출력 번호 변수 정의 -->
				<c:set var="num" value="${listcount-(page-1)*limit }"/>
				<!-- 반복문 시작 -->
				<c:forEach var="b" items="${userList }">
					<tr>
						<td style="text-align: center;">${num }</td>
						<c:set var="num" value="${num-1 }"/>

						<td>${b.username }</td>
						<td>${b.name }</td>
						<td>${b.nick }</td>
						<td>${b.phone }</td>
						<td>${b.birth}</td>
						<td>
							<c:choose>
								<c:when test="${b.sex eq 1}">
									남자
								</c:when>
								<c:when test="${b.sex eq 0 }">
									여자
								</c:when>
							</c:choose>
						</td>
						<td>${b.email }</td>
						<td>${b.address1 }</td>
						<td>${b.address2 }</td>
						<td>${b.point}</td>
						<td>${b.follow }</td>
						<td>${b.level}</td>
						<td>${b.exp}</td>
						<td>
							<c:choose>
								<c:when test="${b.email_ck eq 1}">
									Y
								</c:when>
								<c:when test="${b.email_ck eq 0}">
									N
								</c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${b.msg_ck eq 1}">
									Y
								</c:when>
								<c:when test="${b.msg_ck eq 0}">
									N
								</c:when>
							</c:choose>
						</td>
						<td>
							<fmt:formatDate value="${b.register_date}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>
							<fmt:formatDate value="${b.last_date}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<td>${b.enabled }</td>

						<td>
							<c:choose>
								<c:when test="${b.getUserRole.get(0).role eq 'ROLE_ADMIN'}">
									관리자
								</c:when>
								<c:when test="${b.getUserRole.get(0).role eq 'ROLE_USER'}">
									일반
								</c:when>
							</c:choose>
						</td>
						<td>
							<input class="btn btn-primary btn-sm" type="button" value="수정" onClick="location.href='<c:url value='/admin/userModifyForm?username=${b.username}' />'">
						</td>
					</tr>
				</c:forEach>
			</table>
			<center style="margin-top: 10px;">
				<%-- <c:if test="${page <= 1 }">
                    [이전]&nbsp;
                </c:if> --%>

				<c:if test="${page>1}">
					<a href="<c:url value="/admin/userList?page=${page-1 }" />">[이전]</a>
				</c:if>
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==page }">
						[${a }]
					</c:if>
					<c:if test="${a != page }">
						<a href="<c:url value="/admin/userList?page=${a }" />">[${a }]</a>
					</c:if>
				</c:forEach>

				<%-- <%-- <c:if test="${page>=maxpage }">
                [다음]
                </c:if> --%>
				<c:if test="${page<maxpage }">
					<a href="<c:url value="/admin/userList?page=${page+1 }" />">[다음]</a>
				</c:if>

			</center>
			<center>
				<form style="margin-top: 10px;" action=<c:url value="/admin/search"/> name="search" method="post">
					<!-- <div class="row">
						<div class="col-xs-2 col-xs-offset-5" style="margin-left: 38.666667%!important;">
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
										<span id="search_concept">Filter by</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#contains">Contains</a></li>
										<li><a href="#its_equal">It's equal</a></li>
										<li><a href="#greather_than">Greather than ></a></li>
										<li><a href="#less_than">Less than < </a></li>
										<li class="divider"></li>
										<li><a href="#all">Anything</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all" id="search_param">
								<input style="width: 200px!important;" type="text" class="form-control" name="x" placeholder="Search term...">
								<span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
							</div>
						</div>
					</div> -->

					<select name="keyfield">
						<option value="username" selected>아이디</option>
						<option value="name" >이름</option>
						<option value="nick" >닉네임</option>
						<option value="phone" >핸드폰</option>
						<option value="email" >이메일</option>

					</select>
					<input type="text" name="keyword" id="keyword">
					<input type="submit" value="검색" onclick="return check()">
				</form>
			</center>

		</div>
	</div>
</section>
<script>
    $(document).ready(function(e){
        $('.search-panel .dropdown-menu').find('a').click(function(e) {
            e.preventDefault();
            var param = $(this).attr("href").replace("#","");
            var concept = $(this).text();
            $('.search-panel span#search_concept').text(concept);
            $('.input-group #search_param').val(param);
        });
    });
</script>
