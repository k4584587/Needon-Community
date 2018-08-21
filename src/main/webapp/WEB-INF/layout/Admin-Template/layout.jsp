<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 메인해드시작 -->
<tiles:insertAttribute name="head" />
<!-- 메인 해드 끝 -->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

	<!-- 해더 시작 { -->
	<header class="main-header">
		<tiles:insertAttribute name="top" />
		<tiles:insertAttribute name="menu" />
	</header>
	<!-- 해더 끝 } -->

	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<tiles:insertAttribute name="sidebar" />
	</aside>

	<!-- 내용시작 { -->
	<div class="col" style="margin-top:10px;">
		<tiles:insertAttribute name="body" />
	</div>
	<!-- 내용 끝 } -->


	<!-- 풋더시작 { -->
	<tiles:insertAttribute name="footer" />
	<!-- 풋더 끝 } -->
</div>


<!-- jQuery 3 -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery/dist/jquery.min.js" />"></script>
<!-- jQuery UI 1.11.4 -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-ui/jquery-ui.min.js" />"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/bootstrap/dist/js/bootstrap.min.js" />"></script>
<!-- Morris.js charts -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/raphael/raphael.min.js" />"></script>
<script src="<c:url value="/resources/Admin_LTE/bower_components/morris.js/morris.min.js" />"></script>
<!-- daterangepicker -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/moment/min/moment.min.js" />"></script>
<script src="<c:url value="/resources/Admin_LTE/bower_components/bootstrap-daterangepicker/daterangepicker.js" />"></script>
<!-- datepicker -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" />"></script>

<!-- Bootstrap WYSIHTML5 -->
<script src="<c:url value="/resources/Admin_LTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" />"></script>
<!-- Slimscroll -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js" />"></script>

<%--<!-- Sparkline -->
&lt;%&ndash;<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js" />"></script>&ndash;%&gt;
<!-- jvectormap -->
<script src="<c:url value="/resources/Admin_LTE/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" />"></script>
<script src="<c:url value="/resources/Admin_LTE/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" />"></script>
&lt;%&ndash;<!-- jQuery Knob Chart -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-knob/dist/jquery.knob.min.js" />"></script>&ndash;%&gt;
<!-- daterangepicker -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/moment/min/moment.min.js" />"></script>
<script src="<c:url value="/resources/Admin_LTE/bower_components/bootstrap-daterangepicker/daterangepicker.js" />"></script>
<!-- datepicker -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js" />"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<c:url value="/resources/Admin_LTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" />"></script>
<!-- Slimscroll -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js" />"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/Admin_LTE/bower_components/fastclick/lib/fastclick.js" />"></script>
<!-- AdminLTE App -->
&lt;%&ndash;<script src="<c:url value="/resources/Admin_LTE/dist/js/adminlte.min.js" />"></script>&ndash;%&gt;
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value="/resources/Admin_LTE/dist/js/pages/dashboard.js" />"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/resources/Admin_LTE/dist/js/demo.js" />"></script>--%>

</body>
  
</html>
