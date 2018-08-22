<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
				   url="jdbc:log4jdbc:mysql://13.125.208.101/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC&useSSL=false&autoReconnectForPools=true&autoReconnection=true&testWhileIdle=false"
				   user="admin_project" password="3class"/>

<sql:query dataSource="${datasource}" var="message_count">
	SELECT
		COUNT(IF(info_read_count = 1, null, 0)) AS count
	FROM
		nb_message
	WHERE
		you = '${user.username}'
</sql:query>

<c:forEach items="${message_count.rows}" var="message">
		<c:set value="${message.count}" var="message_new_count" />
</c:forEach>




<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top">
	<!-- Sidebar toggle button-->
	<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
		<span class="sr-only">Toggle navigation</span>
	</a>
	<!-- Navbar Right Menu -->
	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->
			<li class="dropdown messages-menu">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-envelope-o"></i>
					<span class="label label-success" id="message_count">
						${message_new_count}
					</span>
				</a>
				<ul class="dropdown-menu">
					<li class="header">새로운 쪽지가 ${message_new_count} 개 있습니다.</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu" id="message_list">

						</ul>
					</li>
					<li class="footer"><a href="#">전체 쪽지 보기</a></li>
				</ul>
			</li>
			<!-- Notifications: style can be found in dropdown.less -->
			<li class="dropdown notifications-menu">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<i class="fa fa-bell-o"></i>
					<span class="label label-warning">10</span>
				</a>
				<ul class="dropdown-menu">
					<li class="header">You have 10 notifications</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li>
								<a href="#">
									<i class="fa fa-users text-aqua"></i> 5 new members joined today
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
									page and may cause design problems
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-users text-red"></i> 5 new members joined
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-shopping-cart text-green"></i> 25 sales made
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa fa-user text-red"></i> You changed your username
								</a>
							</li>
						</ul>
					</li>
					<li class="footer"><a href="#">View all</a></li>
				</ul>
			<li>
				<a href="<c:url value="/" />"><i class="fa fa-home" aria-hidden="true"></i></a>
			</li>
			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<img src="<c:url value="/resources/img/profile_img.png" />" class="user-image" alt="User Image">
					<span class="hidden-xs">${user.nick}</span>
				</a>
				<ul class="dropdown-menu">
					<!-- User image -->
					<li class="user-header">
						<img src="<c:url value="/resources/img/profile_img.png" />" class="img-circle" alt="User Image">

						<p>
							${user.nick}
							<small>${user.register_date}</small>
						</p>
					</li>
					<!-- Menu Body -->
					<li class="user-body">
						<div class="row">
							<div class="text-center" align="center">
								<a href="#">팔로우 ${user.follow} 명</a>
							</div>
						</div>
						<!-- /.row -->
					</li>
					<!-- Menu Footer-->
					<li class="user-footer">
						<div class="pull-left">
							<a href="#" class="btn btn-default btn-flat">정보수정</a>
						</div>
						<div class="pull-right">
							<a href="#" class="btn btn-default btn-flat">로그아웃</a>
						</div>
					</li>
				</ul>
			</li>
			<!-- Control Sidebar Toggle Button -->
			<li>
				<a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
			</li>
		</ul>
	</div>

</nav>