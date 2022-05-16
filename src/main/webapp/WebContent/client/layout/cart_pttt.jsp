<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header" role="tab" id="step3header">
		<h5 class="mb-0">
			<a data-toggle="collapse" data-parent="#cart-steps-accordion"
				href="#step3contentid" aria-expanded="true"
				aria-controls="step3contentid" class="text-uppercase header"><span
				class="steps">3</span> <span class="label">Thanh toán đặt mua</span>
				<i class="fa fa-chevron-right float-right"></i> </a>
		</h5>
	</div>
	<c:choose>
		<c:when test="${sessionScope.kh!=null }">
			<div id="step3contentid" class="collapse in" role="tabpanel"
				aria-labelledby="step3header" class="stepscontent">
				<div class="card-body" style="padding: 15px;">
					<form action="/home/cartSubmit?name=btnXacNhan">
						<div class="pttt">
							<h6 class="header text-uppercase">Chọn phương thức thanh
								toán</h6>
							<div class="option mb-2">
								<input type="radio" name="pttt" id="cod" value="cod" checked> <label
									for="cod">Thanh toán bằng tiền mặt khi nhận hàng</label>
							</div>
							<div class="option option2">
								<input type="radio" name="pttt" id="atm" value="atm"> <label
									for="atm" class="chuyenkhoan">Thanh toán chuyển khoản
									trước qua Thẻ ATM/Internet Banking</label>
								<p class="mt-4">- Quý khách chỉ chuyển khoản khi được xác
									nhận qua email từ 3TKeyStore.</p>
								<p>- Thời gian chuyển khoản là trong tối đa 2 ngày từ khi nhận được email xác nhận.</p>
								<p>
									- Nội dung chuyển khoản cần ghi: <a href="#">[Mã đơn hàng]</a>
									; hoặc <a href="#">[số điện thoại dùng đặt hàng]</a>
								</p>
								<p>
									- Xem thông tin chuyển khoản của 3TKeyStore thông qua email 
								</p>
							</div>
						</div>
						<hr>
						<button
							class="btn btn-lg btn-block btn-checkout text-uppercase text-white"
							style="background: #F5A623" type="submit" name="btnXacNhan">Đặt mua</button>
						<p class="text-center note-before-checkout">(Vui lòng kiểm tra
							lại đơn hàng trước khi Đặt Mua)</p>
					</form>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="step3contentid" class="collapse in" role="tabpanel"
				aria-labelledby="step3header" class="stepscontent">
				<div class="card-body">
					<h5>Vui lòng đăng nhập</h5>
				</div>
		</c:otherwise>
	</c:choose>
</div>