<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${ title }</title>
<tiles:insertAttribute name="head" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<header class="main-header">
		<tiles:insertAttribute name="top" />
		<tiles:insertAttribute name="menu" />
	</header>

	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<tiles:insertAttribute name="sidebar" />
	</aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<tiles:insertAttribute name="body" />
	</div>

	<footer class="main-footer">
		<tiles:insertAttribute name="footer" />
	</footer>

</div>

<!-- jQuery 3 -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery/dist/jquery.min.js" />"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/bootstrap/dist/js/bootstrap.min.js" />"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/fastclick/lib/fastclick.js" />"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/Admin_LTE/dist/js/adminlte.min.js" />"></script>
<!-- Sparkline -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js" />"></script>
<!-- jvectormap  -->
<script src="<c:url value="/resources/Admin_LTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" />"></script>
<script src="<c:url value="/resources/Admin_LTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" />"></script>
<!-- SlimScroll -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js" />"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value="/resources/Admin_LTE/dist/js/pages/dashboard2.js" />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/resources/Admin_LTE/dist/js/demo.js" />"></script>

</body>
</html>
