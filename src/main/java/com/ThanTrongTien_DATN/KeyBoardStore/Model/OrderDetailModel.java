package com.ThanTrongTien_DATN.KeyBoardStore.Model;

public class OrderDetailModel {
	private Long CTHD;
	private Long MaHD;
	private String MaSP;
	private String TenSP;
	private Integer SoLuong;
	private Long ThanhTien;
	public OrderDetailModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDetailModel(Long cTHD, Long maHD, String maSP, String tenSP, Integer soLuong, Long thanhTien) {
		super();
		CTHD = cTHD;
		MaHD = maHD;
		MaSP = maSP;
		TenSP = tenSP;
		SoLuong = soLuong;
		ThanhTien = thanhTien;
	}
	public Long getCTHD() {
		return CTHD;
	}
	public void setCTHD(Long cTHD) {
		CTHD = cTHD;
	}
	public Long getMaHD() {
		return MaHD;
	}
	public void setMaHD(Long maHD) {
		MaHD = maHD;
	}
	public String getMaSP() {
		return MaSP;
	}
	public void setMaSP(String maSP) {
		MaSP = maSP;
	}
	public String getTenSP() {
		return TenSP;
	}
	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}
	public Integer getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(Integer soLuong) {
		SoLuong = soLuong;
	}
	public Long getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(Long thanhTien) {
		ThanhTien = thanhTien;
	}
	
}
