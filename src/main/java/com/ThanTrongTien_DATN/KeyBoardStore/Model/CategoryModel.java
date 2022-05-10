package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.io.Serializable;

public class CategoryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	private String maloai;
	private String tenloai;
	public CategoryModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryModel(String maloai, String tenloai) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
	}

	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
}
