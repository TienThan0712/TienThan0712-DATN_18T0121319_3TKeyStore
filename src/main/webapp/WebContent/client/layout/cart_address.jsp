<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header" role="tab" id="step2header">
		<h5 class="mb-0">
			<a data-toggle="collapse" data-parent="#cart-steps-accordion"
				href="#step2contentid" aria-expanded="true"
				aria-controls="step2contentid" class="text-uppercase header"><span
				class="steps">2</span> <span class="label">Địa chỉ giao hàng</span>
				<i class="fa fa-chevron-right float-right"></i> </a>
		</h5>
	</div>
	<c:choose>
		<c:when test="${sessionScope.kh!=null }">
			<div id="step2contentid" class="collapse in" role="tabpanel"
				aria-labelledby="step2header" class="stepscontent">
				<div class="card-body">
					<form class="form-diachigiaohang" action="/home/customerDetail?makh=${sessionScope.kh.getMaKH()}" >
						<div class="form-label-group">
							<input type="text" id="inputName" class="form-control" placeholder="Nhập họ tên"
								name="HoTen" value="${sessionScope.kh.getHoTen()}" required autofocus>
						</div>
						<div class="form-label-group">
							<input type="text" id="inputPhone" class="form-control"
								placeholder="Nhập số điện thoại" name="SoDT" value="${sessionScope.kh.getSoDT()}" required>
						</div>
						<div class="form-label-group">
							<input type="email" id="inputEmail" class="form-control"
								placeholder="Nhập địa chỉ email" name="Email" value="${sessionScope.kh.getEmail()}" required>
						</div>
						<div class="form-label-group">
							<input type="text" id="inputAddress" class="form-control"
								placeholder="Nhập Địa chỉ giao hàng" name="DiaChi" value="${sessionScope.kh.getDiaChi()}" required>
						</div>
						<button
							class="btn btn-lg btn-block text-uppercase text-white"
							style="background: #F5A623" type="submit" name="btnUpdateCart">UPDATE</button>
					</form>
				</div>
		</c:when>
		<c:otherwise>
			<div id="step2contentid" class="collapse in" role="tabpanel"
				aria-labelledby="step2header" class="stepscontent">
				<div class="card-body">
					<h5>Vui lòng đăng nhập</h5>
				</div>
		</c:otherwise>
	</c:choose>

</div>