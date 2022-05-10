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
			<h1 class="page-header">Sửa thông tin sản phẩm</h1>
		</div>
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="position-center">
						<form role="form" action="/admin/editProductInfo" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label style="color: black; font-size: 20px">Mã sản phẩm</label>
								<input type="text" name="masp" class="form-control"
									id="exampleInputEmail1" readonly="readonly"
									value="${spbean.getMaSP() }">
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Tên sản
									phẩm</label> <input type="text" name="tensp" class="form-control"
									id="exampleInputPassword1" value="${spbean.getTenSP() }">
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Giá sản
									phẩm</label> <input type="text" name="dongia" class="form-control"
									id="exampleInputPassword1" value="${spbean.getDonGia() }">
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Giảm giá
									(%)</label> <input type="text" name="giamgia" class="form-control"
									id="exampleInputPassword1" value="${spbean.getGiamGia() }">
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Mã thương hiệu</label> <select
									class="form-control" required name="maloai">
									<c:forEach items="${dsloai }" var="s">
										<c:if test="${spbean.getMaLoai() eq s.getMaloai() }">
											<option value="${spbean.getMaLoai()}" selected="selected">
												${s.getTenloai() }</option>
										</c:if>
									</c:forEach>
									<c:forEach items="${dsloai }" var="s">
										<c:choose>
											<c:when test="${spbean.getMaLoai() eq s.getMaloai() }">
												<option value="${spbean.getMaLoai()}" hidden="">
													${s.getTenloai() }</option>
											</c:when>
											<c:otherwise>
												<option value="${s.getMaloai() }">${s.getTenloai() }
												</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Ngày thêm</label> <input
									type="date" name="ngaythem" class="form-control"
									id="exampleInputPassword1" value="${spbean.getNgayThem() }">
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Thêm ảnh
									sản phẩm</label> <input type="file" name="anhsp" id="anhsp">
							</div>
							<div class="form-group">
								<label style="color: black; font-size: 20px">Mô tả sản
									phẩm</label>
								<textarea style="width: 1170px; height: 323px" name="mota"
									required="required">${spbean.getMoTa() }</textarea>
							</div>
							<button type="submit" name="btnSua" class="btn btn-info"
								style="background: #F44336">Sửa thông tin</button>
						</form>
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