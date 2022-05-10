
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="<c:url value='/assets/js/jquery-1.10.2.js'/>"></script>

<!-- Bootstrap Js -->
<script src="<c:url value='/assets/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/materialize/js/materialize.min.js'/>"></script>

<!-- Metis Menu Js -->
<script src="<c:url value='/assets/js/jquery.metisMenu.js'/>"></script>

<!-- Morris Chart Js -->
<script src="<c:url value='/assets/js/morris/raphael-2.1.0.min.js'/>"></script>
<script src="<c:url value='/assets/js/morris/morris.js'/>"></script>
<script src="<c:url value='/assets/js/easypiechart.js'/>"></script>
<script src="<c:url value='/assets/js/easypiechart-data.js'/>"></script>
<script
	src="<c:url value='/assets/js/Lightweight-Chart/jquery.chart.js'/>"></script>

<!-- DATA TABLE SCRIPTS -->
<script src="/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
	$(document).ready(function() {
		$('#dataTables-example').dataTable();
	});
</script>
<!-- Custom Js -->
<script src="<c:url value='/assets/js/custom-scripts.js'/>"></script>