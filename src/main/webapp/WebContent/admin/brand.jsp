<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/assets/materialize/css/materialize.min.css'/>"
	media="screen,projection" />
<!-- Bootstrap Styles-->
<link href="<c:url value='/assets/css/bootstrap.css'/>" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="<c:url value='/assets/css/font-awesome.css'/>"
	rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="<c:url value='/assets/js/morris/morris-0.4.3.min.css'/>"
	rel="stylesheet" />
<!-- Custom Styles-->
<link href="<c:url value='/assets/css/custom-styles.css'/>"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="<c:url value='/assets/js/Lightweight-Chart/cssCharts.css'/>">
</head>
<body>
	<c:if test="${not empty tb}">
		<script>
			let message = "${tb}";
			alert(message);
		</script>
	</c:if>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">Danh sách loại switch</h1>
		</div>
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th class="center">Mã loại switch</th>
											<th class="center">Tên loại switch</th>
											<th class="center">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<form>
										<tr class="">
											<td class="center">blue</td>
											<td class="center">Blue Switch</td>
											<td class="center"><a
												href="/admin/editCategory?maloai=${s.getMaloai()}">Sửa</a> <span>|</span>
												<a href="/admin/deleteCategory?maloai=${s.getMaloai()}">Xóa</a>
											</td>
										</tr>
										</form>
										<form>
										<tr class="">
											<td class="center">red</td>
											<td class="center">Red Switch</td>
											<td class="center"><a
												href="/admin/editbrand">Sửa</a> <span>|</span>
												<a href="/admin/deleteCategory?maloai=${s.getMaloai()}">Xóa</a>
											</td>
										</tr>
										</form>
										<form>
										<tr class="">
											<td class="center">brown</td>
											<td class="center">Brown Switch</td>
											<td class="center"><a
												href="/admin/editCategory?maloai=${s.getMaloai()}">Sửa</a> <span>|</span>
												<a href="/admin/deleteCategory?maloai=${s.getMaloai()}">Xóa</a>
											</td>
										</tr>
										</form>
										<form>
										<tr class="">
											<td class="center">black</td>
											<td class="center">Black Switch</td>
											<td class="center"><a
												href="/admin/editCategory?maloai=${s.getMaloai()}">Sửa</a> <span>|</span>
												<a href="/admin/deleteCategory?maloai=${s.getMaloai()}">Xóa</a>
											</td>
										</tr>
										</form>
										<form>
										<tr class="">
											<td class="center">slient</td>
											<td class="center">Slient Switch</td>
											<td class="center"><a
												href="/admin/editCategory?maloai=${s.getMaloai()}">Sửa</a> <span>|</span>
												<a href="/admin/deleteCategory?maloai=${s.getMaloai()}">Xóa</a>
											</td>
										</tr>
										</form>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
			<footer>
				<p>All right reserved. Template by: JavaNC</p>
			</footer>
		</div>
	</div>
	<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>