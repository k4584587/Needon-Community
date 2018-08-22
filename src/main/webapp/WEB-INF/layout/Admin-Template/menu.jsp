<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>
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
					<span class="label label-success">4</span>
				</a>
				<ul class="dropdown-menu">
					<li class="header">You have 4 messages</li>
					<li>
						<!-- inner menu: contains the actual data -->
						<ul class="menu">
							<li><!-- start message -->
								<a href="#">
									<div class="pull-left">
										<img src="<c:url value="/resources/img/profile_img.png" />" class="img-circle" alt="User Image">
									</div>
									<h4>
										Support Team
										<small><i class="fa fa-clock-o"></i> 5 mins</small>
									</h4>
									<p>Why not buy a new awesome theme?</p>
								</a>
							</li>
							<!-- end message -->
						</ul>
					</li>
					<li class="footer"><a href="#">See All Messages</a></li>
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