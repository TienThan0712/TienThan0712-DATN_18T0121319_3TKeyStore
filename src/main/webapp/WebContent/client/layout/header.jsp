<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>

	<!-- header -->
	<nav class="navbar navbar-expand-md bg-white navbar-light">
		<div class="container">
			<!-- logo  -->
			<a class="navbar-brand" href="/home" style="color: #CF111A;"><b>3TKEY</b>Store</a>
			<!-- navbar-toggler  -->
			<button class="navbar-toggler d-lg-none" type="button"
				data-toggle="collapse" data-target="#collapsibleNavId"
				aria-controls="collapsibleNavId" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavId">
				<!-- form tìm kiếm  -->
				<form class="form-inline ml-auto my-2 my-lg-0 mr-3"
					action="/home/search">
					<div class="input-group" style="width: 520px;">
						<input type="text" class="form-control" aria-label="Small"
							placeholder="Nhập sản phẩm cần tìm kiếm..." name="key">
						<div class="input-group-append">
							<button type="submit" class="btn"
								style="background-color: #CF111A; color: white;">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
				<!-- ô đăng nhập đăng ký giỏ hàng trên header  -->
				<ul class="navbar-nav mb-1 ml-auto">
					<li class="nav-item product"><a href="/home/product"
						class="btn btn-secondary rounded-circle"> <i
							class="fa fa-solid fa-keyboard"></i>
					</a> <a class="nav-link text-dark product text-uppercase"
						href="/home/product" style="display: inline-block;">Sản phẩm</a></li>
					<c:choose>
						<c:when test="${sessionScope.kh!=null }">
							<li class="nav-item giohang mr-3"><a href="/home/cart"
								class="btn btn-secondary rounded-circle"> <i
									class="fa fa-shopping-cart"></i>
							</a> <a class="nav-link text-dark giohang text-uppercase"
								href="/home/cart" style="display: inline-block">Giỏ Hàng</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item giohang  mr-2"><a href="/home/cart"
								class="btn btn-secondary rounded-circle"> <i
									class="fa fa-shopping-cart"></i>
							</a> <a class="nav-link text-dark giohang text-uppercase"
								href="/home/cart" style="display: inline-block">Giỏ Hàng</a></li>
						</c:otherwise>
					</c:choose>

					<div class="dropdown">
						<c:choose>
							<c:when test="${sessionScope.kh!=null }">
								<li class="nav-item account " type="button" class="btn dropdown"
									data-toggle="dropdown"><a href="#"
									class="btn btn-secondary rounded-circle"> <i
										class="fa fa-user"></i>
								</a> <a class="nav-link text-dark text-uppercase" href="#"
									style="display: inline-block">${sessionScope.kh.getUserName()}</a>
								</li>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item text-center mb-2"
										href="/home/customerDetail">Thông tin cá nhân</a> <a
										class="dropdown-item text-center mb-2" href="/home/order">Thông
										tin đơn hàng</a> <a class="dropdown-item text-center mb-2"
										href="/home/logout?name=logoutkh">Đăng Xuất</a>
								</div>
							</c:when>
							<c:otherwise>
								<li class="nav-item account" type="button" class="btn dropdown"
									data-toggle="dropdown"><a href="#"
									class="btn btn-secondary rounded-circle"> <i
										class="fa fa-user"></i>
								</a> <a class="nav-link text-dark text-uppercase" href="#"
									style="display: inline-block">Tài khoản</a></li>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

									<a class="dropdown-item nutdangnhap text-center mb-2" href="#"
										data-toggle="modal" data-target="#formdangnhap">Đăng nhập</a>
									<a class="dropdown-item nutdangky text-center " href="#"
										data-toggle="modal" data-target="#formdangky">Đăng ký</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</ul>
			</div>
		</div>
	</nav>

	<!-- form dang ky khi click vao button tren header-->
	<div class="modal fade mt-5" id="formdangky" data-backdrop="static"
		tabindex="-1" aria-labelledby="dangky_tieude" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<ul class="tabs d-flex justify-content-around list-unstyled mb-0">
						<li class="tab tab-dangnhap text-center"><a
							class=" text-decoration-none">Đăng nhập</a>
							<hr></li>
						<li class="tab tab-dangky text-center"><a
							class="text-decoration-none">Đăng ký</a>
							<hr></li>
					</ul>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/home/register" method="POST" id="form-signup"
						class="form-signin mt-2">
						<div class="form-label-group">
							<input type="email" class="form-control" name="email" 
								placeholder="Nhập Email" />
						</div>
						<div class="form-label-group">
							<input type="text" class="form-control" name="name" 
								placeholder="Nhập họ tên" />
						</div>
						<div class="form-label-group">
							<input type="text" class="form-control" name="sdt" 
								placeholder="Nhập số điện thoại" />
						</div>
						<div class="form-label-group">
							<input type="text" class="form-control" name="diachi" 
								placeholder="Nhập địa chỉ" />
						</div>
						<div class="form-label-group">
							<input type="password" class="form-control" name="pass"
								id="InputPassword" placeholder="Nhập mật khẩu" /> <span
								toggle="#password"
								class="zmdi zmdi-eye field-icon toggle-password"></span>
						</div>
						<div class="form-label-group mb-4">
                            <input type="password" class="form-control" name="confirm_password"
                                placeholder="Nhập lại mật khẩu" required>
                        </div>
						<div class="g-recaptcha ml-3"
							data-sitekey="6LfTF_AfAAAAAFuklySFxZats2bVdnE9G5ggp3Au"></div>
						<script>
					  grecaptcha.ready(function() {
					      grecaptcha.execute('reCAPTCHA_site_key', {action: 'homepage'}).then(function(token) {
					         ...
					      });
					  });
					  </script>
						<button
							class="btn btn-lg btn-block btn-signin text-uppercase text-white mt-3"
							type="submit" style="background: #F5A623">Đăng ký</button>
						<hr class="mt-3 mb-2">
						<div class="custom-control custom-checkbox">
							<p class="text-center">Bằng việc đăng ký, bạn đã đồng ý với
								3TKeyStore về</p>
							<a href="#" class="text-decoration-none text-center"
								style="color: #F5A623">Điều khoản dịch vụ & Chính sách bảo
								mật</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- form dang nhap khi click vao button tren header-->
	<div class="modal fade mt-5" id="formdangnhap" data-backdrop="static"
		tabindex="-1" aria-labelledby="dangnhap_tieude" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<ul class="tabs d-flex justify-content-around list-unstyled mb-0">
						<li class="tab tab-dangnhap text-center"><a
							class=" text-decoration-none">Đăng nhập</a>
							<hr></li>
						<li class="tab tab-dangky text-center"><a
							class="text-decoration-none">Đăng ký</a>
							<hr></li>
					</ul>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<script
						src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"
						async defer></script>
					<form id="form-signin" class="form-signin mt-2"
						action="/home/login" method="get">
						<div class="form-label-group">
							<input type="email" class="form-control"
								placeholder="Nhập Email đăng nhập" name="email" required autofocus>
						</div>

						<div class="form-label-group">
							<input type="password" class="form-control"
								placeholder="Nhập mật khẩu" name="pass" required>
						</div>

						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" class="custom-control-input"
								id="customCheck1" name="check" value="on"> <label
								class="custom-control-label" for="customCheck1">Nhớ mật
								khẩu </label> <a href="/home/password"
								class="float-right text-decoration-none" style="color: #F5A623">Quên
								mật khẩu</a>
						</div>
						<div class="g-recaptcha ml-3"
							data-sitekey="6LfTF_AfAAAAAFuklySFxZats2bVdnE9G5ggp3Au"></div>
						<script>
					  grecaptcha.ready(function() {
					      grecaptcha.execute('reCAPTCHA_site_key', {action: 'homepage'}).then(function(token) {
					         ...
					      });
					  });
					  </script>
						<button
							class="btn btn-lg btn-block btn-signin text-uppercase text-white mt-2"
							type="submit" style="background: #F5A623">Đăng nhập</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>