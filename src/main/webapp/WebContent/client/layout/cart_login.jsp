<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card">
	<c:choose>
		<c:when test="${sessionScope.kh!=null }">
			<div class="card-header cardheader" role="tab" id="step1header">
				<h5 class="mb-0">
					<a data-toggle="collapse" data-parent="#cart-steps-accordion"
						href="#step1contentid" aria-expanded="true"
						aria-controls="step1contentid" class="text-uppercase header"><span
						class="steps">1</span> <span class="label">XIN CHÀO
							${sessionScope.kh.getUserName()} </span> <i
						class="fa fa-chevron-right float-right"></i> </a>
				</h5>
			</div>
		</c:when>
		<c:otherwise>
			<div class="card-header cardheader" role="tab" id="step1header">
				<h5 class="mb-0">
					<a data-toggle="collapse" data-parent="#cart-steps-accordion"
						href="#step1contentid" aria-expanded="true"
						aria-controls="step1contentid" class="text-uppercase header"><span
						class="steps">1</span> <span class="label">KHÁCH HÀNG MỚI /
							ĐĂNG NHẬP</span> <i class="fa fa-chevron-right float-right"></i> </a>
				</h5>
			</div>
			<div id="step1contentid" class="collapse in" role="tabpanel"
				aria-labelledby="step1header" class="stepscontent">
				<div class="card-body p-0">
					<nav>
						<div class="nav nav-tabs dangnhap-dangky" id="nav-tab"
							role="tablist">
							<a class="nav-item nav-link active text-center text-uppercase"
								id="nav-dangnhap-tab" data-toggle="tab" href="#nav-dangnhap"
								role="tab" aria-controls="nav-dangnhap" aria-selected="true">Đăng
								nhập</a> <a class="nav-item nav-link text-center text-uppercase"
								id="nav-dangky-tab" data-toggle="tab" href="#nav-dangky"
								role="tab" aria-controls="nav-dangky" aria-selected="false">Đăng
								ký</a>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-dangnhap"
							role="tabpanel" aria-labelledby="nav-dangnhap-tab">
							<form id="form-signin-cart" class="form-signin mt-2"
								action="/home/loginCart" method="post">
								<div class="form-label-group">
									<input type="text" id="inputEmail" class="form-control"
										placeholder="Nhập địa chỉ email" name="user" required
										autofocus>
								</div>
								<div class="form-label-group">
									<input type="password" id="inputPassword" class="form-control"
										placeholder="Mật khẩu" name="pass" required>
								</div>
								<div class="custom-control custom-checkbox mb-3">
									<a href="#" class="float-right text-decoration-none"
										style="color: #F5A623">Quên mật khẩu</a>
								</div>
								<button
									class="btn btn-lg btn-block btn-signin text-uppercase text-white"
									type="submit" style="background: #F5A623">Đăng nhập</button>
								<hr class="my-4">
								<button class="btn btn-lg btn-google btn-block text-uppercase"
									type="submit">
									<i class="fab fa-google mr-2"></i> Đăng nhập bằng Google
								</button>
								<button class="btn btn-lg btn-facebook btn-block text-uppercase"
									type="submit">
									<i class="fab fa-facebook-f mr-2"></i> Đăng nhập bằng Facebook
								</button>
							</form>
						</div>
						<div class="tab-pane fade" id="nav-dangky" role="tabpanel"
							aria-labelledby="nav-dangky-tab">
							<form id="form-signup-cart" class="form-signin mt-2"
								method="post" action="/home/registerCart">
								<div class="form-label-group">
									<input type="text" class="form-control" name="user" id="user"
										placeholder="Nhập tên đăng nhập" />
								</div>
								<div class="form-label-group">
									<input type="password" class="form-control" name="pass"
										id="password" placeholder="Nhập mật khẩu" /> <span
										toggle="#password"
										class="zmdi zmdi-eye field-icon toggle-password"></span>
								</div>
								<div class="form-label-group">
									<input type="text" class="form-control" name="name" id="name"
										placeholder="Nhập họ tên" />
								</div>
								<div class="form-label-group">
									<input type="email" class="form-control" name="email"
										id="email" placeholder="Nhập Email" />
								</div>
								<div class="form-label-group">
									<input type="text" class="form-control" name="sdt" id="sdt"
										placeholder="Nhập số điện thoại" />
								</div>
								<div class="form-label-group">
									<input type="text" class="form-control" name="diachi"
										id="diachi" placeholder="Nhập địa chỉ" />
								</div>
								<div class="custom-control custom-checkbox mb-3">
									<p class="text-center">Bằng việc đăng ký, bạn đã đồng ý với
										3TKeyStore về</p>
									<a href="#" class="text-decoration-none text-center"
										style="color: #F5A623">Điều khoản dịch vụ & Chính sách bảo
										mật</a>
								</div>
								<hr class="mt-3 mb-2">
								<button
									class="btn btn-lg btn-block btn-signin text-uppercase text-white mt-3"
									type="submit" style="background: #F5A623">Đăng ký</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>