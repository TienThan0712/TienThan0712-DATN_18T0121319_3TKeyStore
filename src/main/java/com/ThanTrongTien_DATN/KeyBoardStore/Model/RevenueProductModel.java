package com.ThanTrongTien_DATN.KeyBoardStore.Model;

public class RevenueProductModel {
	private String MaSP;
	private String TenSP;
	private String AnhSP;
	private Integer SoLuong;
	private Long TongTien;
	public RevenueProductModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RevenueProductModel(String maSP, String tenSP, String anhSP, Integer soLuong, Long tongTien) {
		super();
		MaSP = maSP;
		TenSP = tenSP;
		AnhSP = anhSP;
		SoLuong = soLuong;
		TongTien = tongTien;
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
	public String getAnhSP() {
		return AnhSP;
	}
	public void setAnhSP(String anhSP) {
		AnhSP = anhSP;
	}
	public Integer getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(Integer soLuong) {
		SoLuong = soLuong;
	}
	public Long getTongTien() {
		return TongTien;
	}
	public void setTongTien(Long tongTien) {
		TongTien = tongTien;
	}
	

}
