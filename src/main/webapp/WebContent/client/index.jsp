<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang chủ</title>
<meta charset="UTF-8">
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
	href="<c:url value='/css/home.css'/>">
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
<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
</head>

<body>
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
				<div class="col-md-3">
					<div class="categoryheader">
						<div class="noidungheader text-white">
							<i class="fa fa-bars"></i> <span
								class="text-uppercase font-weight-bold ml-1">Danh mục
								thương hiệu</span>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="benphai float-right">
						<div class="hotline">
							<i class="fa fa-phone"></i> <span>Hotline:<b>038 584
									2033</b>
							</span>
						</div>
						<i class="fas fa-comments-dollar"></i> <a href="#">Hỗ trợ trực
							tuyến </a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="header bg-light">
		<div class="container">
			<div class="row">
				<div class="col-md-3" style="margin-right: -15px;">
					<!-- CATEGORIES -->
					<div class="categorycontent">
						<ul>
							<c:forEach items="${dsloai}" var="s">
								<li class="liheader"><a href="#"
									class="header text-uppercase"> <a
										href="/home/product?ml=${s.getMaloai()}">
											${s.getTenloai()} </a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- banner slider  -->
				<div class="col-md-9 px-0">
					<div id="carouselId" class="carousel slide" data-ride="carousel">
						<ol class="nutcarousel carousel-indicators rounded-circle">
							<li data-target="#carouselId" data-slide-to="0" class="active"></li>
							<li data-target="#carouselId" data-slide-to="1"></li>
							<li data-target="#carouselId" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<a href="#"><img
									src="https://akkogear.com.vn/wp-content/uploads/2021/03/AKKO_3087_3108_v2_DS_Horizon_Banner.jpg"
									class="img-fluid" style="height: 386px;" width="900px"
									alt="First slide"></a>
							</div>
							<div class="carousel-item">
								<a href="#"><img
									src="https://akkogear.com.vn/wp-content/uploads/2021/03/AKKO_Monets__POND_BANNER.jpg"
									class="img-fluid" style="height: 386px;" width="900px"
									alt="Second slide"></a>
							</div>
							<div class="carousel-item">
								<a href="#"><img
									src="https://akkogear.com.vn/wp-content/uploads/2020/12/matchabanner.jpg"
									class="img-fluid" style="height: 386px;" alt="Third slide"></a>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselId"
							data-slide="prev"> <span class="carousel-control-prev-icon"
							aria-hidden="true"></span> <span class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselId"
							data-slide="next"> <span class="carousel-control-next-icon"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="_1khoi banphimmoi bg-white">
		<div class="container">
			<div class="noidung" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
						<h1 class="header text-uppercase" style="font-weight: 400;">BÀN
							PHÍM MỚI TUYỂN CHỌN</h1>
						<a href="/home/productNew"
							class="btn btn-warning btn-sm text-white">Xem tất cả</a>
					</div>
				</div>
				<div class="khoisanpham" style="padding-bottom: 2rem;">
					<!-- 1 san pham -->
					<c:forEach items="${dsspmoi}" var="s">
						<div class="card">
							<a href="/home/productDetail?masp=${s.getMaSP()}"
								class="motsanpham" style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anh" src="/${s.getAnhSP()}" alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">${s.getTenSP()}</h3>
									<small class="thuonghieu text-muted">Thương hiệu: ${s.getTenLoai()}</small>
									<small class="thuonghieu text-muted">Loại Switch: ${s.getTenSwitch()}</small>
									<div class="gia d-flex align-items-baseline">
										<div class="giamoi">
											<fmt:formatNumber type="NUMBER" value="${s.getGiaSale()}" />
											đ
										</div>
										<div class="giacu text-muted">
											<fmt:formatNumber type="NUMBER" value="${s.getDonGia()}" />
											đ
										</div>
										<div class="sale">-${s.getGiamGia()}%</div>
									</div>
									<div class="danhgia">
										<ul class="d-flex" style="list-style: none;">
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star"></i></li>
											<li><span class="text-muted">0 nhận xét</span></li>
										</ul>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<section class="_1khoi combohot mt-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header -->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light">
						<h2 class="header text-uppercase" style="font-weight: 400;">BÀN
							PHÍM HOT - GIẢM ĐẾN 25%</h2>
						<a href="/home/productHot"
							class="btn btn-warning btn-sm text-white">Xem tất cả</a>
					</div>
				</div>
				<div class="khoisanpham">
					<c:forEach items="${dssphot}" var="s">
						<div class="card">
							<a href="/home/productDetail?masp=${s.getMaSP()}"
								class="motsanpham" style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anh" src="/${s.getAnhSP()}" alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">${s.getTenSP()}</h3>
									<small class="thuonghieu text-muted">Thương hiệu: ${s.getTenLoai()}</small>
									<small class="thuonghieu text-muted">Loại Switch: ${s.getTenSwitch()}</small>
									<div class="gia d-flex align-items-baseline">
										<div class="giamoi">
											<fmt:formatNumber type="NUMBER" value="${s.getGiaSale()}" />
											đ
										</div>
										<div class="giacu text-muted">
											<fmt:formatNumber type="NUMBER" value="${s.getDonGia()}" />
											đ
										</div>
										<div class="sale">-${s.getGiamGia()}%</div>
									</div>
									<div class="danhgia">
										<ul class="d-flex" style="list-style: none;">
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li class="active"><i class="fa fa-star"></i></li>
											<li><i class="fa fa-star"></i></li>
											<li><span class="text-muted">0 nhận xét</span></li>
										</ul>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>

	<section class="_1khoi camnang bg-white mt-4">
		<div class="container">
			<div class="noidung" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-transparent pt-4">
						<h2 class="header text-uppercase" style="font-weight: 400;">CẨM
							NANG</h2>
						<a href="#" class="btn btn-warning btn-sm text-white">Xem tất
							cả</a>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anhcamnang"
								src="https://siliconz.vn/storage/images/ban-phim-co-custom-2048x1152.jpg"
								alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Hướng dẫn Custom phím cơ</h3>
									<small class="thoigian text-muted">03/04/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anhcamnang"
								src="https://siliconz.vn/storage/images/ban-phim-co-custom-2048x1152.jpg"
								alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Hướng dẫn Custom phím cơ</h3>
									<small class="thoigian text-muted">03/04/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anhcamnang"
								src="https://siliconz.vn/storage/images/ban-phim-co-custom-2048x1152.jpg"
								alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Hướng dẫn Custom phím cơ</h3>
									<small class="thoigian text-muted">03/04/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anhcamnang"
								src="https://siliconz.vn/storage/images/ban-phim-co-custom-2048x1152.jpg"
								alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Hướng dẫn Custom phím cơ</h3>
									<small class="thoigian text-muted">03/04/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="col-lg col-sm-4">
						<div class="card">
							<a href="#" class="motsanpham"
								style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anhcamnang"
								src="https://siliconz.vn/storage/images/ban-phim-co-custom-2048x1152.jpg"
								alt="#">
								<div class="card-body noidungsp mt-3">
									<h3 class="card-title ten">Hướng dẫn Custom phím cơ</h3>
									<small class="thoigian text-muted">03/04/2020</small>
									<div>
										<a class="detail" href="#">Xem chi tiết</a>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<hr>
		</div>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>