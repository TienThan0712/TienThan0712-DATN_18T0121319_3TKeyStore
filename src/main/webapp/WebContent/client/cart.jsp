<%@page import="com.ThanTrongTien_DATN.KeyBoardStore.Model.CartModel"%>
<%@page import="com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl.CartServiceImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<link rel="stylesheet" type="text/css" href="/css/cart.css">
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/footer.css">
<script type="text/javascript" src="/js/main.js"></script>
<link rel="stylesheet" href="/fontawesome_free_5.13.0/css/all.css">

<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="/slick/slick-theme.css" />
<script type="text/javascript" src="/slick/slick.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<link rel="canonical" href="http://dealbook.xyz/">
<meta name="google-site-verification"
	content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
<link rel="manifest" href="/favicon_io/site.webmanifest">
</head>
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
	<section class="content my-3">
		<div class="container">
			<div class="cart-page bg-white">
				<div class="row">
					<%
					if (session.getAttribute("gh") != null) {
					%>
					<!-- giao diện giỏ hàng khi có hàng -->
					<div class="col-md-8 cart">
						<div class="cart-content py-3 pl-3">
							<h6 class="header-gio-hang">
								GIỎ HÀNG CỦA BẠN <span>(<%=session.getAttribute("count")%>)
								</span>
							</h6>
							<%
							CartServiceImpl gh1 = (CartServiceImpl) session.getAttribute("gh");
							for (CartModel g : gh1.ds) {
							%>
							<form action="/home/cartDetail?maspham=<%=g.getMaSP()%>"
								method="post">
								<div class="cart-list-items">
									<div class="cart-item d-flex">
										<a href="/home/productDetail?masp=<%=g.getMaSP()%>" class="img"> <img
											src="/<%=g.getAnhSP()%>" class="img-fluid" alt="anhsp1">
										</a>
										<div class="item-caption d-flex w-100">
											<div class="item-info ml-3">
												<a href="/home/productDetail?masp=<%=g.getMaSP()%>"
													class="ten"><%=g.getTenSP()%></a>
												<div class="soluong d-flex">
													<div class="input-number input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text btn-spin btn-dec">-</span>
														</div>
														<input type="text" value=<%=g.getSoLuong()%> name="sl"
															class="soluongsp  text-center">
														<div class="input-group-append">
															<span class="input-group-text btn-spin btn-inc">+</span>
														</div>
													</div>
												</div>
											</div>
											<div
												class="item-price ml-auto d-flex flex-column align-items-end">
												<div class="giamoi"><span class="total"><%=en.format(g.getGia())%></span>₫ </div>
												<div>
													<button name="btnSua" style="border: none;">
														<span class="remove mt-auto"><i class="fas fa-edit"></i></span>
													</button>
												</div>
												<div>
													<button name="btnXoa" style="border: none;">
														<span class="remove mt-auto"><i class="far fa-trash-alt"></i></span>
													</button>
												</div>
											</div>
										</div>
									</div>
									<hr>
								</div>
							</form>
							<%
							}
							%>
							<div class="row">
								<div class="col-md-4">
									<a href="/home/product" class="btn nutmuathem mb-3">Mua thêm</a>
									<a href="/home/cartDetail?name=btnXoaAll" class="btn nutmuathem mb-3">Trả tất cả</a>
								</div>
								<div class="col-md-4 offset-md-4">
									<div class="tonggiatien">
										<div class="group d-flex justify-content-between">
											<p class="label">Tạm tính:</p>
											<p class="tamtinh"><%=en.format(gh1.TongTien())%>
												₫
											</p>
										</div>
										<div class="group d-flex justify-content-between">
											<p class="label">Giảm giá:</p>
											<p class="giamgia">0 ₫</p>
										</div>
										<div class="group d-flex justify-content-between">
											<p class="label">Phí vận chuyển:</p>
											<p class="phivanchuyen">0 ₫</p>
										</div>
										<div class="group d-flex justify-content-between">
											<p class="label">Phí dịch vụ:</p>
											<p class="phidicvu">0 ₫</p>
										</div>
										<div
											class="group d-flex justify-content-between align-items-center">
											<strong class="text-uppercase">Tổng cộng:</strong>
											<p class="tongcong"><span id="ordertotal"> <%=en.format(gh1.TongTien())%></span>₫</p>
										</div>
										<small class="note d-flex justify-content-end text-muted">
											(Giá đã bao gồm VAT) </small>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4 cart-steps pl-0">
						<div id="cart-steps-accordion" role="tablist"
							aria-multiselectable="true">
							<jsp:include page="layout/cart_login.jsp"></jsp:include>
							<jsp:include page="layout/cart_address.jsp"></jsp:include>
							<jsp:include page="layout/cart_pttt.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<%
				} else {
				%>
				<div class="col-12 cart-empty">
					<div class="py-3 pl-3">
						<div
							class="cart-empty-content w-100 text-center justify-content-center">
							<img src="/image/shopping-cart-not-product.png"
								alt="shopping-cart-not-product">
							<p>Chưa có sản phẩm nào trong giỏ hàng của bạn</p>
							<a href="/home/product" class="btn nutmuathem mb-3">Mua thêm</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		</div>
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.min.js"></script>
	<script type="text/javascript"></script>
</body>
</html>