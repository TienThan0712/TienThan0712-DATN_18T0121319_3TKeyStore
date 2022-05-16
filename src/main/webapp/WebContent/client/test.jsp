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
<link rel="canonical" href="http://dealbook.xyz/">
<meta name="google-site-verification"
	content="urDZLDaX8wQZ_-x8ztGIyHqwUQh2KRHvH9FhfoGtiEw" />
<link rel="manifest"
	href="<c:url value='/favicon_io/site.webmanifest'/>">
</head>

<body>
	<form action="/test" style="display: flex;" method="get">
		<ul class="mr-2">
			<label for="hienthi-select" class="label-select">Thương hiệu</label>
			<select class="sapxep-select" name="thuonghieu">
				<option value="">Mặc định</option>
				<c:forEach items="${dsloai}" var="s">
					<option value="${s.getMaloai()}">${s.getTenloai()}</option>
				</c:forEach>
			</select>
		</ul>
		<ul class="mr-2">
			<label for="hienthi-select" class="label-select">Loại Switch</label>
			<select class="sapxep-select" name="loai">
				<option value="">Mặc định</option>
				<c:forEach items="${dsswitch}" var="s">
					<option value="${s.getMaSwitch()}">${s.getTenSwitch()}</option>
				</c:forEach>
			</select>
		</ul>
		<ul class="mr-2">
			<label for="hienthi-select" class="label-select">Giá</label>
			<select class="sapxep-select" name="gia">
				<option value="">Mặc định</option>
				<option value="duoi-1-trieu">Dưới 1 triệu</option>
				<option value="1-trieu-toi-2-trieu">1 triệu -> 2 triệu</option>
				<option value="2-trieu-toi-3-trieu">2 triệu -> 3 triệu</option>
				<option value="tren-3-trieu">Trên 3 triệu</option>
			</select>
		</ul>
		<div class="hien-thi mr-2">
			<button style="border: none" type="submit">
				<a class="btn btn-warning text-white">Lọc</a>
			</button>
		</div>
		</li>
	</form>
</body>
</html>