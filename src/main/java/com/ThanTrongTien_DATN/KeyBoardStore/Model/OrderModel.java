package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.sql.Date;

public class OrderModel {
	private Long MaHD;
	private String HoTen;
	private String SoDT;
	private Long TongTien;
	private Date NgayMua;
	private Date NgayGiaoHang;
	private Integer TrangThai;
	public OrderModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderModel(Long maHD, String hoTen, String soDT, Long tongTien, Date ngayMua, Date ngayGiaoHang,
			Integer trangThai) {
		super();
		MaHD = maHD;
		HoTen = hoTen;
		SoDT = soDT;
		TongTien = tongTien;
		NgayMua = ngayMua;
		NgayGiaoHang = ngayGiaoHang;
		TrangThai = trangThai;
	}
	public Long getMaHD() {
		return MaHD;
	}
	public void setMaHD(Long maHD) {
		MaHD = maHD;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getSoDT() {
		return SoDT;
	}
	public void setSoDT(String soDT) {
		SoDT = soDT;
	}
	public Long getTongTien() {
		return TongTien;
	}
	public void setTongTien(Long tongTien) {
		TongTien = tongTien;
	}
	public Date getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(Date ngayMua) {
		NgayMua = ngayMua;
	}
	public Date getNgayGiaoHang() {
		return NgayGiaoHang;
	}
	public void setNgayGiaoHang(Date ngayGiaoHang) {
		NgayGiaoHang = ngayGiaoHang;
	}
	public Integer getTrangThai() {
		return TrangThai;
	}
	public void setTrangThai(Integer trangThai) {
		TrangThai = trangThai;
	}
	
}
