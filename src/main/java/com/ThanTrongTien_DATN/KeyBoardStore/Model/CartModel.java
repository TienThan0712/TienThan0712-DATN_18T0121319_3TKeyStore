package com.ThanTrongTien_DATN.KeyBoardStore.Model;

public class CartModel {
	private String MaSP;
	private String AnhSP;
	private String TenSP;
	private Long Gia;
	private Long SoLuong;
	@SuppressWarnings("unused")
	private Long ThanhTien;
	public CartModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartModel(String maSP,String anhSP, String tenSP, Long gia, Long soLuong) {
		super();
		MaSP = maSP;
		AnhSP = anhSP;
		TenSP = tenSP;
		Gia = gia;
		SoLuong = soLuong;
		ThanhTien = gia * soLuong;
	}
	public String getMaSP() {
		return MaSP;
	}
	public void setMaSP(String maSP) {
		MaSP = maSP;
	}
	public String getAnhSP() {
		return AnhSP;
	}
	public void setAnhSP(String anhSP) {
		AnhSP = anhSP;
	}
	public String getTenSP() {
		return TenSP;
	}
	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}
	public Long getGia() {
		return Gia;
	}
	public void setGia(Long gia) {
		Gia = gia;
	}
	public Long getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(Long soLuong) {
		SoLuong = soLuong;
	}
	public Long getThanhTien() {
		return Gia * SoLuong;
	}
	public void setThanhTien(Long thanhTien) {
		ThanhTien = thanhTien;
	}
}
