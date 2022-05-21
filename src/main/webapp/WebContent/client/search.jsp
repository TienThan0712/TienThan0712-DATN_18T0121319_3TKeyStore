<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sản phẩm</title>
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
	href="<c:url value='/css/product.css'/>">
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
<meta name="google-site-verification"
	content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
</head>

<body>
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
									<li class="liheader"><a href="#"
										class="header text-uppercase"> <a
											href="/home/product?ml=${s.getMaloai()}">
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

	<!-- breadcrumb  -->
	<section class="breadcrumbbar">
		<div class="container">
			<ol class="breadcrumb mb-0 p-0 bg-transparent">
				<li class="breadcrumb-item"><a href="/home">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="/home/product">Sản
						phẩm</a></li>
				<li class="breadcrumb-item active"><a href="ProductController">
						Kết quả tìm kiếm</a></li>
			</ol>
		</div>
	</section>

	<section class="page-content my-3">
		<div class="container">
			<div>
				<h1 class="header text-uppercase">Kết quả tìm kiếm: ${key }</h1>
			</div>
		</div>
	</section>

	<!-- khối sản phẩm  -->
	<section class="content my-4">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="items">
					<div class="row">
						<c:forEach items="${products.pageList}" var="s">
							<div class="col-lg-3 col-md-4 col-xs-6 item DeanGraziosi">
								<div class="card ">
									<a href="/home/productDetail?masp=${s.getMaSP()}"
										class="motsanpham"
										style="text-decoration: none; color: black;"
										data-toggle="tooltip" data-placement="bottom" title="#"> <img
										class="card-img-top anh" src="/${s.getAnhSP()}" alt="#">
										<div class="card-body noidungsp mt-3">
											<h6 class="card-title ten">${s.getTenSP()}</h6>
											<small class="thuonghieu text-muted">${s.getTenLoai()}</small>
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
													<span class="text-muted">0 nhận xét</span>
												</ul>
											</div>
										</div>
									</a>
									<div class="info-item">
										<a class="AddToCart btn"
											href="/home/cartDetail?masp=${s.getMaSP()}&anhsp=${s.getAnhSP()}&tensp=${s.getTenSP()}&gia=${s.getGiaSale()}">
											THÊM VÀO GIỎ HÀNG <i class="fa fa-shopping-cart"></i>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<!-- pagination bar -->
				<div class="pagination-bar my-3">
					<div class="row">
						<div class="col-12">
							<nav>
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link"
										href="/home/search" aria-label="Next"> <span
											aria-hidden="true">«</span> <span class="sr-only">Prev</span>
									</a></li>
									<li
										class="${currentProduct == 1 ? 'page-item disabled': 'page-item'}"><a
										class="page-link"
										href="/home/search/page/${currentProduct - 1}"
										aria-label="Next"> <span aria-hidden="true">‹</span> <span
											class="sr-only">Prev</span>
									</a></li>
									<c:forEach begin="${beginProduct}" end="${endProduct}" var="i">
										<li
											class="${i == currentProduct ? 'page-item active': 'page-item'}"><a
											class="page-link" href="/home/search/page/${i}">${i}</a></li>
									</c:forEach>

									<li
										class="${currentProduct == totalPageCount? 'page-item disabled': 'page-item'}"><a
										class="page-link"
										href="/home/search/page/${currentProduct + 1}"
										aria-label="Next"> <span aria-hidden="true">›</span> <span
											class="sr-only">Next</span>
									</a></li>
									<li class="page-item"><a class="page-link"
										href="/home/search/page/${totalPageCount}" aria-label="Next">
											<span aria-hidden="true">»</span> <span class="sr-only">Next</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>