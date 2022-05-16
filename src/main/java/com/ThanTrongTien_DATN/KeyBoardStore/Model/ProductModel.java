package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.springframework.data.annotation.Id;

public class ProductModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String MaSP;
	private String AnhSP;
	private String TenSP;
	private Long DonGia;
	private Integer GiamGia;
	private Long GiaSale;
	private String MaLoai;
	private String TenLoai;
	private String MaSwitch;
	private String TenSwitch;
	private Date NgayThem;
	private String MoTa;
	public ProductModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductModel(String maSP, String anhSP, String tenSP, Long donGia, Integer giamGia, Long giaSale,
			String maLoai, String tenLoai, String maSwitch, String tenSwitch, Date ngayThem, String moTa) {
		super();
		MaSP = maSP;
		AnhSP = anhSP;
		TenSP = tenSP;
		DonGia = donGia;
		GiamGia = giamGia;
		GiaSale = giaSale;
		MaLoai = maLoai;
		TenLoai = tenLoai;
		MaSwitch = maSwitch;
		TenSwitch = tenSwitch;
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
	public String getMaSwitch() {
		return MaSwitch;
	}
	public void setMaSwitch(String maSwitch) {
		MaSwitch = maSwitch;
	}
	public String getTenSwitch() {
		return TenSwitch;
	}
	public void setTenSwitch(String tenSwitch) {
		TenSwitch = tenSwitch;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ProductModel [MaSP=" + MaSP + ", AnhSP=" + AnhSP + ", TenSP=" + TenSP + ", DonGia=" + DonGia
				+ ", GiamGia=" + GiamGia + ", GiaSale=" + GiaSale + ", MaLoai=" + MaLoai + ", TenLoai=" + TenLoai
				+ ", MaSwitch=" + MaSwitch + ", TenSwitch=" + TenSwitch + ", NgayThem=" + NgayThem + ", MoTa=" + MoTa
				+ "]";
	}
	
}
