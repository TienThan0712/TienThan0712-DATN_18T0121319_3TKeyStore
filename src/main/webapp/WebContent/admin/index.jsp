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
			<h1 class="page-header">Trang chủ</h1>
		</div>
		<div id="page-inner">
			<div class="dashboard-cards">
				<h4>Thông tin website</h4>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
							<div class="card-image red">
								<i class="material-icons dp48">equalizer</i>
							</div>
							<div class="card-stacked red">
								<div class="card-content text-center">
									<h3>${product}</h3>
								</div>
								<div class="card-action">
									<strong>SẢN PHẨM</strong>
								</div>
							</div>
						</div>

					</div>
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
							<div class="card-image orange">
								<i class="material-icons dp48">equalizer</i>
							</div>
							<div class="card-stacked orange">
								<div class="card-content text-center">
									<h3>${category}</h3>
								</div>
								<div class="card-action">
									<strong>THƯƠNG HIỆU</strong>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
							<div class="card-image blue">
								<i class="material-icons dp48">equalizer</i>
							</div>
							<div class="card-stacked blue">
								<div class="card-content text-center">
									<h3>${switchkey }</h3>
								</div>
								<div class="card-action">
									<strong>LOẠI SWITCH</strong>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="card horizontal cardIcon waves-effect waves-dark">
							<div class="card-image green">
								<i class="material-icons dp48">supervisor_account</i>
							</div>
							<div class="card-stacked green">
								<div class="card-content text-center">
									<h3>${customer }</h3>
								</div>
								<div class="card-action">
									<strong>KHÁCH HÀNG</strong>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4> Đơn hàng </h4>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-3">
							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image blue">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked blue">
									<div class="card-content text-center">
										<h3>${orderwaiting }</h3>
									</div>
									<div class="card-action text-center">
										<strong>ĐƠN HÀNG CHỜ XÁC NHẬN</strong>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-3">
							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image orange">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked orange">
									<div class="card-content text-center">
										<h3>${orderpayment }</h3>
									</div>
									<div class="card-action text-center">
										<strong>ĐƠN HÀNG CHỜ THANH TOÁN</strong>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-3">
							<div class="card horizontal cardIcon waves-effect waves-dark">
								<div class="card-image green">
									<i class="material-icons dp48">shopping_cart</i>
								</div>
								<div class="card-stacked green">
									<div class="card-content text-center">
										<h3>${orderdone }</h3>
									</div>
									<div class="card-action text-center">
										<strong>ĐƠN HÀNG GIAO THÀNH CÔNG</strong>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<footer>
				<p>All right reserved.</p>
			</footer>
		</div>
	</div>
	<jsp:include page="layout/script.jsp"></jsp:include>
</body>
</html>