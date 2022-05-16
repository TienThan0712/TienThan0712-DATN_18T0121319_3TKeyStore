<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="wrapper">
	<nav class="navbar navbar-default top-navbar" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle waves-effect waves-dark"
				data-toggle="collapse" data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand waves-effect waves-dark" href="/home"
				target="_blank"><i class="large material-icons">track_changes</i>
				<strong>3TKeyStore</strong></a>

			<div id="sideNav" href="">
				<i class="material-icons dp48">toc</i>
			</div>
		</div>

		<ul class="nav navbar-top-links navbar-right">
			<li><a class="dropdown-button waves-effect waves-dark" href="#!"
				data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>${sessionScope.ad.getUserName()}</b>
					<i class="material-icons right">arrow_drop_down</i></a></li>
		</ul>
	</nav>
	<ul id="dropdown1" class="dropdown-content">
		<li><a href="/home/logout?name=logoutadmin"><i
				class="fa fa-sign-out fa-fw"></i> Logout</a></li>
	</ul>
	<!--/. NAV TOP  -->
	<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li><a
					class="${link == 'index' ? 'active-menu' : '' } waves-effect waves-dark"
					href="/admin"><i class="fa fa-dashboard"></i> Trang chủ</a></li>
				<li><a href="#"
					class="${link == 'product' ? 'active-menu' : '' } waves-effect waves-dark"><i
						class="fa fa-sitemap"></i> Sản Phẩm<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/admin/product"
							class="${linkProduct == 'productList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i> Danh sách sản phẩm</a></li>
						<li><a href="/admin/addProduct"
							class="${linkProduct == 'addProduct' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-edit"></i> Thêm sản phẩm </a></li>
					</ul></li>
				<li><a href="#"
					class="${link == 'category' ? 'active-menu' : '' } waves-effect waves-dark"><i
						class="fa fa-sitemap"></i>Thương hiệu<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/admin/category"
							class="${linkCategory == 'categoryList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i> Danh sách thương hiệu</a></li>
						<li><a href="/admin/addCategory"
							class="${linkCategory == 'addCategory' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-edit"></i> Thêm thương hiệu </a></li>
					</ul></li>
				<li><a href="#"
					class="${link == 'switch' ? 'active-menu' : '' } waves-effect waves-dark"><i
						class="fa fa-sitemap"></i>Loại Switch<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/admin/switch"
							class="${linkSwitch == 'switchList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i> Danh sách Loại Switch</a></li>
						<li><a href="/admin/addSwitch"
							class="${linkSwitch == 'addSwitch' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-edit"></i> Thêm loại Switch </a></li>
					</ul></li>
				<li><a href="/admin/customer"
					class="${link == 'customer' ? 'active-menu' : '' } waves-effect waves-dark"><i
						class="fa fa-table"></i> Danh sách khách hàng</a></li>
				<li><a href="#"
					class="${link == 'order' ? 'active-menu' : '' } waves-effect waves-dark"><i
						class="fa fa-table
						"></i>Đơn hàng<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/admin/orderWaiting"
							class="${linkorder == 'orderWaitingList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i>Đơn hàng chờ xác nhận</a></li>
						<li><a href="/admin/orderPayment"
							class="${linkorder == 'orderPaymentList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i>Đơn hàng chờ thanh toán</a></li>
						<li><a href="/admin/orderDone"
							class="${linkorder == 'orderDoneList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i>Đơn hàng đã thanh toán</a></li>
						<li><a href="/admin/orderCancel"
							class="${linkorder == 'orderCancelList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i>Đơn hàng đã hủy</a></li>
					</ul></li>
				<li><a href="#"
					class="${link == 'revenue' ? 'active-menu' : '' } waves-effect waves-dark"><i
						class="fa fa-table
						"></i>Doanh thu<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/admin/revenueMonth"
							class="${linkRevenue == 'revenueTimeList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i>Doanh thu theo thời gian</a></li>
						<li><a href="/admin/revenueProduct"
							class="${linkRevenue == 'revenueProductList' ? 'active-menu' : '' } waves-effect waves-dark"><i
								class="fa fa-table"></i>Doanh thu theo sản phẩm</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</div>