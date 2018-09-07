<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="datasource" driver="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"
				   url="jdbc:log4jdbc:mysql://13.125.208.101/admin_project?useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&serverTimezone=UTC&useSSL=false&autoReconnectForPools=true&autoReconnection=true&testWhileIdle=false"
				   user="admin_project" password="3class"/>

<sql:query dataSource="${datasource}" var="member_count">
	SELECT
	count(*) count
	FROM
	nb_member
</sql:query>

<c:forEach items="${member_count.rows}" var="count">
	<c:set var="member_count" value="${count.count}"/>
</c:forEach>

<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
	<!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img src="<c:url value="/resources/img/profile_img.png" />" class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>${user.nick}</p>
			<a href="#"><i class="fa fa-circle text-success"></i> 온라인</a>
		</div>
	</div>
	<!-- search form -->
	<form action="#" method="get" class="sidebar-form">
		<div class="input-group">
			<input type="text" name="q" class="form-control" placeholder="검색">
			<span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                  <i class="fa fa-search"></i>
                </button>
              </span>
		</div>
	</form>
	<!-- /.search form -->
	<!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu" data-widget="tree">
		<li class="header">MAIN NAVIGATION</li>
		<li><a href="<c:url value="/admin/" />"><i class="fa fa-dashboard"></i>  <span>대시보드</span></a></li>
		<li><a href="<c:url value="/admin/menu_list" />"><i class="fa fa-dashboard"></i>  <span>메뉴관리</span></a></li>

		<li class="treeview">
			<a href="#">
				<i class="fa fa-users" aria-hidden="true"></i>
				<span>회원관리</span>
				<span class="pull-right-container">
              <span class="label label-primary pull-right">${member_count}</span>
            </span>
			</a>
			<ul class="treeview-menu">
				<li><a href="<c:url value="/admin/userList" />"><i class="fa fa-circle-o"></i> 회원관리</a></li>
			</ul>
		</li>

		<li class="treeview">
			<a href="#">
				<i class="fa fa-pencil-square-o" aria-hidden="true"></i> <span>게시판 관리</span>
				<span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
			</a>
			<ul class="treeview-menu">
				<li><a href="<c:url value="/admin/board_list" />"><i class="fa fa-circle-o"></i> 게시판 관리</a></li>
				<li><a href="<c:url value="/admin/page_list" />"><i class="fa fa-circle-o"></i> 페이지 관리</a></li>
			</ul>
		</li>
	</ul>
</section>
<!-- /.sidebar -->