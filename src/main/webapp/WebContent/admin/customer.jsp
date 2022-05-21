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
			<h1 class="page-header">Danh sách khách hàng</h1>
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
											<th class="center">Mã KH</th>
											<th class="center">Tên KH</th>
											<th class="center">Địa chỉ</th>
											<th class="center">Số điện thoại</th>
											<th class="center">Email</th>
											<th class="center">UserName</th>
											<th class="center">Trạng Thái</th>
											<th class="center">Hành động</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dskh}" var="s">
											<form>
												<tr class="">
													<td class="center">${s.getMaKH()}</td>
													<td class="center">${s.getHoTen()}</td>
													<td class="center">${s.getDiaChi()}</td>
													<td class="center">${s.getSoDT()}</td>
													<td class="center">${s.getEmail()}</td>
													<td class="center">${s.getUserName()}</td>
													<c:if test="${s.getTrangThai() == 1 }">
														<td class="center">Active </td>
														<td class="center">
															<a href="/admin/customer?makh=${s.getMaKH()}&name=btnBlock">Block</a>
														</td>
													</c:if>
													<c:if test="${s.getTrangThai() == 0 }">
														<td class="center">Block </td>
														<td class="center">
															<a href="/admin/customer?makh=${s.getMaKH()}&name=btnActive">Active</a>
														</td>
													</c:if>
													
												</tr>
											</form>
										</c:forEach>
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