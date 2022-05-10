package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.io.Serializable;
import java.sql.Date;

public class ProductModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String MaSP;
	private String AnhSP;
	private String TenSP;
	private Long DonGia;
	private Integer GiamGia;
	private Long GiaSale;
	private String MaLoai;
	private String TenLoai;
	private Date NgayThem;
	private String MoTa;
	public ProductModel() {
		super();
	}
	public ProductModel(String maSP, String anhSP, String tenSP, Long donGia, Integer giamGia, Long giaSale,
			String maLoai, String tenLoai, Date ngayThem, String moTa) {
		super();
		MaSP = maSP;
		AnhSP = anhSP;
		TenSP = tenSP;
		DonGia = donGia;
		GiamGia = giamGia;
		GiaSale = giaSale;
		MaLoai = maLoai;
		TenLoai = tenLoai;
		NgayThem = ngayThem;
		MoTa = moTa;
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
	public Long getDonGia() {
		return DonGia;
	}
	public void setDonGia(Long donGia) {
		DonGia = donGia;
	}
	public Integer getGiamGia() {
		return GiamGia;
	}
	public void setGiamGia(Integer giamGia) {
		GiamGia = giamGia;
	}
	public Long getGiaSale() {
		return GiaSale;
	}
	public void setGiaSale(Long giaSale) {
		GiaSale = giaSale;
	}
	public String getMaLoai() {
		return MaLoai;
	}
	public void setMaLoai(String maLoai) {
		MaLoai = maLoai;
	}
	public String getTenLoai() {
		return TenLoai;
	}
	public void setTenLoai(String tenLoai) {
		TenLoai = tenLoai;
	}
	public Date getNgayThem() {
		return NgayThem;
	}
	public void setNgayThem(Date ngayThem) {
		NgayThem = ngayThem;
	}
	public String getMoTa() {
		return MoTa;
	}
	public void setMoTa(String moTa) {
		MoTa = moTa;
	}
}
