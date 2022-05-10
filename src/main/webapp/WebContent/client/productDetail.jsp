<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chi tiết sản phẩm</title>
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
	href="<c:url value='/css/productDetail.css'/>">
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
						<div class="categorycontent">
							<ul>
								<c:forEach items="${dsloai}" var="s">
									<li class="liheader"><a href="#"
										class="header text-uppercase"> <a
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

	<section class="product-page mb-4">
		<div class="container">
			<div class="product-detail bg-white p-4">
				<div class="row">
					<div class="col-md-5 khoianh">
						<div class="anhto mb-4">
							<a class="active" data-fancybox="thumb-img"> <img
								class="product-image" src="/${sp.getAnhSP()}"
								style="width: 100%;">
							</a>
						</div>
						<div class="list-anhchitiet d-flex mb-4"
							style="margin-left: 2rem;">
							<img class="thumb-img thumb1 mr-3" src="/${sp.getAnhSP()}"
								class="img-fluid"> <img class="thumb-img thumb2"
								src="/${sp.getAnhSP()}" class="img-fluid">
						</div>
					</div>
					<div class="col-md-7 khoithongtin">
						<div class="row">
							<div class="col-md-12 header">
								<h4 class="ten">${sp.getTenSP()}</h4>
								<div class="rate">
									<i class="fa fa-star active"></i> <i class="fa fa-star active"></i>
									<i class="fa fa-star active"></i> <i class="fa fa-star active"></i>
									<i class="fa fa-star "></i>
								</div>
								<hr>
							</div>
							<div class="col-md-7">
								<div class="gia">
									<div class="giabia">
										Giá gốc:<span class="giacu ml-2"><fmt:formatNumber
												type="NUMBER" value="${sp.getDonGia()}" />đ</span>
									</div>
									<div class="giaban">
										Giá bán tại 3TKeyStore: <span class="giamoi font-weight-bold"><fmt:formatNumber
												type="NUMBER" value="${sp.getGiaSale()}" />đ</span>
									</div>
									<div class="tietkiem">
										Tiết kiệm: <b> <fmt:formatNumber type="NUMBER"
												value="${sp.getDonGia() - sp.getGiaSale()}" /> đ
										</b> <span class="sale">-${sp.getGiamGia()}%</span>
									</div>
								</div>
								<div class="uudai my-3">
									<h6 class="header font-weight-bold">Khuyến mãi & Ưu đãi
										tại 3TKeyStore:</h6>
									<ul>
										<li><b>Miễn phí giao hàng </b>cho đơn hàng từ 1.500.000đ
											ở TP.Huế và 3.000.000đ ở Tỉnh/Thành khác <a href="#">>>
												Chi tiết</a></li>
										<li><b>Combo bàn phím HOT - GIẢM 25% </b><a
											href="/home/productHot">>>Xem ngay</a></li>
										<li>Tặng Key Cap cho mỗi đơn hàng</li>
										<li>Giá cả cạnh tranh</li>
									</ul>
								</div>
								<form
									action="/home/cartDetail?masp=${sp.getMaSP()}&anhsp=${sp.getAnhSP()}&tensp=${sp.getTenSP()}&gia=${sp.getGiaSale()}"
									method="post">
									<div class="soluong d-flex">
										<label class="font-weight-bold">Số lượng: </label>
										<div class="input-number input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text btn-spin btn-dec">-</span>
											</div>
											<input type="text" value="1" name="soluong"
												class="soluongsp text-center">
											<div class="input-group-append">
												<span class="input-group-text btn-spin btn-inc">+</span>
											</div>
										</div>
									</div>
									<button class="nutmua btn w-100 text-uppercase">Chọn
										mua</button>
								</form>
								<a class="huongdanmuahang text-decoration-none" href="#">(Vui
									lòng xem hướng dẫn mua hàng)</a>
							</div>
						</div>
					</div>
					<div class="product-description col-md-9">
						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist">
								<a class="nav-item nav-link active text-uppercase"
									id="nav-gioithieu-tab" data-toggle="tab" href="#nav-gioithieu"
									role="tab" aria-controls="nav-gioithieu" aria-selected="true">Giới
									thiệu</a> <a class="nav-item nav-link text-uppercase"
									id="nav-danhgia-tab" data-toggle="tab" href="#nav-danhgia"
									role="tab" aria-controls="nav-danhgia" aria-selected="false">Đánh
									giá</a>
							</div>
						</nav>
						<!-- nội dung của từng tab  -->
						<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active ml-3" id="nav-gioithieu"
								role="tabpanel" aria-labelledby="nav-gioithieu-tab">
								<h6 class="tieude font-weight-bold">${sp.getTenSP()}</h6>
								<p>
									<span> ${sp.getMoTa()} </span>
								</p>
							</div>
							<div class="tab-pane fade d-none" id="nav-danhgia" role="tabpanel"
								aria-labelledby="nav-danhgia-tab">
								<div class="row">
									<div class="col-md-3 text-center">
										<p class="tieude">Đánh giá trung bình</p>
										<div class="diem">0/5</div>
										<div class="sao">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p class="sonhanxet text-muted">(0 nhận xét)</p>
									</div>
									<div class="col-md-5">
										<div class="tiledanhgia text-center">
											<div class=" align-items-center">
												<div class="danhgia">
													<ul class="d-flex" style="list-style: none;">
														<li class="active"><i class="fa fa-star"></i></li>
														<li class="active"><i class="fa fa-star"></i></li>
														<li class="active"><i class="fa fa-star"></i></li>
														<li class="active"><i class="fa fa-star"></i></li>
														<li><i class="fa fa-star"></i></li>
													</ul>
												</div>
												<div class="form-group">
													<div class="tennguoidung">
														<h6>KH1</h6>										
													</div>
													<input type="text" style="width: 100px; height: 50px" value="Sản phẩm dùng tốt" readonly="readonly">
												</div>
											</div>
											<div class="btn vietdanhgia mt-3">Viết đánh giá của bạn</div>
										</div>
										<div class="formdanhgia">
											<h6 class="tieude text-uppercase">GỬI ĐÁNH GIÁ CỦA BẠN</h6>
											<span class="danhgiacuaban">Đánh giá của bạn về sản
												phẩm này:</span>
											<form action="">
												<div
													class="rating d-flex flex-row-reverse align-items-center justify-content-end">
													<input type="radio" name="star" id="star1"><label
														for="star1"></label> <input type="radio" name="star"
														id="star2"><label for="star2"></label> <input
														type="radio" name="star" id="star3"><label
														for="star3"></label> <input type="radio" name="star"
														id="star4"><label for="star4"></label> <input
														type="radio" name="star" id="star5"><label
														for="star5"></label>
												</div>
												<div class="form-group">
													<input type="text" class="txtFullname w-100"
														placeholder="Mời bạn nhập tên(Bắt buộc)">
												</div>
												<div class="form-group">
													<input type="text" class="txtEmail w-100"
														placeholder="Mời bạn nhập email(Bắt buộc)">
												</div>
												<div class="form-group">
													<input type="text" class="txtComment w-100"
														placeholder="Đánh giá của bạn về sản phẩm này">
												</div>
												<div class="btn nutguibl">
													<button type="button">Gửi bình luận</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="_1khoi sachmoi">
		<div class="container">
			<div class="noidung bg-white" style="width: 100%;">
				<div class="row">
					<!--header-->
					<div
						class="col-12 d-flex justify-content-between align-items-center pb-2 bg-light pt-4">
						<h5 class="header text-uppercase" style="font-weight: 400;">Sản
							phẩm cùng thương hiệu</h5>
						<a href="/home/category?ml=${sp.getMaLoai()}"
							class="btn btn-warning btn-sm text-white">Xem tất cả</a>
					</div>
				</div>

				<div class="khoisanpham" style="padding-bottom: 2rem;">
					<c:forEach items="${dssp}" var="s">
						<div class="card">
							<a href="/home/productDetail?masp=${s.getMaSP()}"
								class="motsanpham" style="text-decoration: none; color: black;"
								data-toggle="tooltip" data-placement="bottom" title="#"> <img
								class="card-img-top anh" src="/${s.getAnhSP()}" alt="#">
								<div class="card-body noidungsp mt-3">
									<h7 class="card-title ten">${s.getTenSP()}</h7>
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
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>