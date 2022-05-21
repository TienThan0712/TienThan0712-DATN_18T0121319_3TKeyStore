<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			<h1 class="page-header">Danh sách đơn hàng đã hủy</h1>
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
											<th class="center">Mã hóa đơn</th>
											<th class="center">Họ tên KH</th>
											<th class="center">Số ĐT</th>
											<th class="center">Tổng tiền</th>
											<th class="center">Ngày mua</th>
											<th class="center">Phuơng thức thanh toán</th>
											<th class="center">Chi tiết</th>
											<th class="center">Trạng thái</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${dsdh}" var="s">
											<tr>
												<td class="center">${s.getMaHD()}</td>
												<td class="center">${s.getHoTen()}</td>
												<td class="center">${s.getSoDT()}</td>
												<td class="center"><fmt:formatNumber type="NUMBER"
														value="${s.getTongTien()}" />đ</td>
												<td class="center">${s.getNgayMua()}</td>
												<td>${s.getPTTT() }</td>
												<td class="center"><a
													href="/admin/orderDetail?mahd=${s.getMaHD()}&name=btnChiTiet">
														Chi tiết</a></td>
												<td class="center">Đã hủy đơn</td>
											</tr>
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