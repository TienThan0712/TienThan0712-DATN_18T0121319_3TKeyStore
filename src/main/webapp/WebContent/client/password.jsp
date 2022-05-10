<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Thông tin khách hàng</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="<c:url value='/css/product.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/header.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
    <script type="text/javascript" src="<c:url value='/js/main.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/fontawesome_free_5.13.0/css/all.css'/>">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="<c:url value='/slick/slick.css'/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value='/slick/slick-theme.css'/>" />
    <script type="text/javascript" src="<c:url value='/slick/slick.min.js'/>"></script>
    <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
    <link rel="canonical" href="http://dealbook.xyz/">
    <meta name="google-site-verification" content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
    <link rel="manifest" href="<c:url value='/favicon_io/site.webmanifest'/>">
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
							<a class="nav-item nav-link active" id="nav-taikhoan-tab"
								data-toggle="tab" href="#nav-taikhoan" role="tab"
								aria-controls="nav-home" aria-selected="true">Quên mật khẩu</a>
						</div>
					</nav>
					<div class="tab-content">
						<div class="tab-pane fade show active pl-4 " id="nav-taikhoan"
							role="tabpanel" aria-labelledby="nav-taikhoan-tab">
							<div class="offset-md-4 mt-3">
								<h3 class="account-header">Thông tin tài khoản</h3>
							</div>
							<form action="/home/customerDetail?name=btnDoiMK" >
								<div class="thay-doi-mk">
									<div class="mkcu my-3">
										<div class="row">
											<label class="col-md-2 offset-md-2" for="account-mkcu">Tên đăng nhâp</label> 
											<input class="col-md-4" type="password" name="PassCu" value="" placeholder="Nhập tên đăng nhập">
										</div>
									</div>
									<div class="mkmoi my-3">
										<div class="row">
											<label class="col-md-2 offset-md-2" for="account-mkmoi">Email</label> 
											<input class="col-md-4" type="password" name="PassMoi" value="" placeholder="Nhập Email">
										</div>
									</div>
									<div class="capnhat my-3">
										<div class="row">
											<button type="submit" name="btnDoiMK" class="button-capnhat text-uppercase offset-md-4 btn btn-warning mb-4">Quên mật khẩu</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>

