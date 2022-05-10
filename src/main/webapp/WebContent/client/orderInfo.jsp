<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Thông tin đơn hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/orderInfo.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/header.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/footer.css'/>">
<script type="text/javascript" src="<c:url value='/js/main.js'/>"></script>
<link rel="stylesheet"
	href="<c:url value='/fontawesome_free_5.13.0/css/all.css'/>">

<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/slick/slick.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/slick/slick-theme.css'/>" />
<script type="text/javascript"
	src="<c:url value='/slick/slick.min.js'/>"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link rel="canonical" href="http://dealbook.xyz/">
<meta name="google-site-verification"
	content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
<link rel="manifest"
	href="<c:url value='/favicon_io/site.webmanifest'/>">
</head>
<body>
	<%
	Locale localeEN = new Locale("en", "EN");
	NumberFormat en = NumberFormat.getInstance(localeEN);
	%>
	<c:if test="${not empty tb}">
		<script>
			let message = "${tb}";
			alert(message);
		</script>
	</c:if>

	<jsp:include page="layout/header.jsp"></jsp:include>
	<section class="duoinavbar">
		<div class="container text-white">
			<div class="row justify">
				<div class="col-lg-3 col-md-5">
					<div class="categoryheader">
						<div class="noidungheader text-white">
							<i class="fa fa-bars"></i> <span
								class="text-uppercase font-weight-bold ml-1">Danh mục
								thương hiệu</span>
						</div>
						<!-- CATEGORIES -->
						<div class="categorycontent">
							<ul>
								<c:forEach items="${dsloai}" var="s">
									<li class="liheader"><a
										href="/home/category?ml=${s.getMaloai()}">
											${s.getTenloai()} </a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-5 ml-auto contact d-none d-md-block">
					<div class="benphai float-right">
						<div class="hotline">
							<i class="fa fa-phone"></i> <span>Hotline:<b>038 584 2033</b>
							</span>
						</div>
						<i class="fas fa-comments-dollar"></i> <a href="#">Hỗ trợ trực
							tuyến </a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="account-page my-3">
		<div class="container">
			<div class="page-content bg-white">
				<div class="account-page-tab-content m-4">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link active" id="nav-donhang-tab"
								data-toggle="tab" href="#nav-donhang" role="tab"
								aria-controls="nav-profile" aria-selected="true">Đơn hàng
								chờ xác nhận</a> <a class="nav-item nav-link" id="nav-donhang-tab-2"
								data-toggle="tab" href="#nav-donhang-2" role="tab"
								aria-controls="nav-profile" aria-selected="false">Đơn hàng
								đang giao</a> <a class="nav-item nav-link" id="nav-donhang-tab-3"
								data-toggle="tab" href="#nav-donhang-3" role="tab"
								aria-controls="nav-profile" aria-selected="false">Đơn hàng
								đã nhận</a> <a class="nav-item nav-link" id="nav-donhang-tab-4"
								data-toggle="tab" href="#nav-donhang-4" role="tab"
								aria-controls="nav-profile" aria-selected="false">Đơn hàng
								đã hủy</a>
						</div>
					</nav>

					<div class="tab-content">
						<!-- nội dung tab 1: danh sách đơn hàng chờ xác nhận-->
						<div class="tab-pane fade show active py-3" id="nav-donhang"
							role="tabpanel" aria-labelledby="nav-donhang-tab">
							<div class="donhang-table">
								<c:choose>
									<c:when test="${fn:length(dsChoXN) > 0}">
										<table class="m-auto">
											<thead>
												<tr>
													<th>Mã hóa đơn</th>
													<th>Tổng tiền</th>
													<th>Ngày mua</th>
													<th>Chi tiết</th>
													<th>Hành động</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dsChoXN}" var="s">
													<form action="/home/order?mahd=${s.getMaHD()}"
														method="post">
														<tr>
															<td>${s.getMaHD() }</td>
															<td><fmt:formatNumber type="NUMBER"
																	value="${s.getTongTien()}" />đ</td>
															<td>${s.getNgayMua() }</td>
															<td>
																<button name="btnChiTiet" type="submit"
																	class="btn btn-warning" value="XacNhan">Chi
																	tiết</button>
															</td>
															<td>
																<button name="btnHuyDon" type="submit"
																	class="btn btn-danger" value="XacNhan">Hủy đơn</button>
															</td>
														</tr>
													</form>
												</c:forEach>
											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<h3 style="text-align: center;">Bạn không có đơn hàng cần
											xác nhận</h3>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- nội dung tab 2: danh sách đơn hàng đang giao -->
						<div class="tab-pane fade py-3" id="nav-donhang-2" role="tabpanel"
							aria-labelledby="nav-donhang-tab">
							<div class="donhang-table">
								<c:choose>
									<c:when test="${fn:length(dsChoTT) > 0}">
										<table class="m-auto">
											<thead>
												<tr>
													<th>Mã hóa đơn</th>
													<th>Tổng tiền</th>
													<th>Ngày mua</th>
													<th>Chi tiết</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dsChoTT}" var="s">
													<form action="/home/order?mahd=${s.getMaHD()}"
														method="post">
														<tr>
															<td>${s.getMaHD() }</td>
															<td><fmt:formatNumber type="NUMBER"
																	value="${s.getTongTien()}" />đ</td>
															<td>${s.getNgayMua() }</td>
															<td>
																<button name="btnChiTiet" type="submit"
																	class="btn btn-warning" value="XacNhan">Chi
																	tiết</button>
															</td>
														</tr>
													</form>
												</c:forEach>

											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<h3 style="text-align: center;">Bạn không có đơn hàng chờ
											thanh toán</h3>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- nội dung tab 3: danh sách đơn hàng đã nhận -->
						<div class="tab-pane fade py-3" id="nav-donhang-3" role="tabpanel"
							aria-labelledby="nav-donhang-tab">
							<div class="donhang-table">
								<c:choose>
									<c:when test="${fn:length(dsDaTT) > 0}">
										<table class="m-auto">
											<thead>
												<tr>
													<th>Mã hóa đơn</th>
													<th>Tổng tiền</th>
													<th>Ngày mua</th>
													<th>Chi tiết</th>
													<th>Trạng thái</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dsDaTT}" var="s">
													<form action="/home/order?mahd=${s.getMaHD()}"
														method="post">
														<tr>
															<td>${s.getMaHD() }</td>
															<td><fmt:formatNumber type="NUMBER"
																	value="${s.getTongTien()}" />đ</td>
															<td>${s.getNgayMua() }</td>
															<td>
																<button name="btnChiTiet" type="submit"
																	class="btn btn-warning" value="XacNhan">Chi
																	tiết</button>
															</td>
															<c:if test="${s.getTrangThai() == 3 }">
																<td>
																	<button name="btnNhanHang" type="submit"
																		class="btn btn-warning" value="XacNhan">Xác nhận đã nhận hàng</button>
																</td>
															</c:if>
															<c:if test="${s.getTrangThai() == 2}">
																<td> Đã nhận hàng</td>
															</c:if>
														</tr>
													</form>
												</c:forEach>

											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<h3 style="text-align: center;">Bạn không có đơn hàng đã
											mua</h3>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- nội dung tab 4: danh sách đơn hàng đã hủy -->
						<div class="tab-pane fade py-3" id="nav-donhang-4" role="tabpanel"
							aria-labelledby="nav-donhang-tab">
							<div class="donhang-table">
								<c:choose>
									<c:when test="${fn:length(dsDaHuy) > 0}">
										<table class="table class="m-auto">
											<thead>
												<tr>
													<th>Mã hóa đơn</th>
													<th>Tổng tiền</th>
													<th>Ngày mua</th>
													<th>Chi tiết</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${dsDaHuy}" var="s">
													<form action="/home/order?mahd=${s.getMaHD()}"
														method="post">
														<tr>
															<td>${s.getMaHD() }</td>
															<td><fmt:formatNumber type="NUMBER"
																	value="${s.getTongTien()}" />đ</td>
															<td>${s.getNgayMua() }</td>
															<td>
																<button name="btnChiTiet" type="submit"
																	class="btn btn-warning" value="XacNhan">Chi
																	tiết</button>
															</td>
														</tr>
													</form>
												</c:forEach>

											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<h3 style="text-align: center;">Bạn không có đơn hàng đã
											hủy</h3>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>