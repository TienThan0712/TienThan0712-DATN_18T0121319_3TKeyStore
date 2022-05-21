package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.springframework.data.annotation.Id;


public class ProductCommentModel implements Serializable{
private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long MaDanhGia;
	private String MaSP;
	private Long MaKhachHang;
	private String HoTen;
	private String NoiDung;
	private Date NgayThem;
	public ProductCommentModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductCommentModel(Long maDanhGia, String maSP, Long maKhachHang, String hoTen, String noiDung,
			Date ngayThem) {
		super();
		MaDanhGia = maDanhGia;
		MaSP = maSP;
		MaKhachHang = maKhachHang;
		HoTen = hoTen;
		NoiDung = noiDung;
		NgayThem = ngayThem;
	}
	public Long getMaDanhGia() {
		return MaDanhGia;
	}
	public void setMaDanhGia(Long maDanhGia) {
		MaDanhGia = maDanhGia;
	}
	public String getMaSP() {
		return MaSP;
	}
	public void setMaSP(String maSP) {
		MaSP = maSP;
	}
	public Long getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(Long maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getNoiDung() {
		return NoiDung;
	}
	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	public Date getNgayThem() {
		return NgayThem;
	}
	public void setNgayThem(Date ngayThem) {
		NgayThem = ngayThem;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
