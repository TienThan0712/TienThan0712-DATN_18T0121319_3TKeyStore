package com.ThanTrongTien_DATN.KeyBoardStore.Model;

public class CustomerModel {
	private Long MaKH;
	private String HoTen;
	private String DiaChi;
	private String SoDT;
	private String Email;
	private String UserName;
	private String Pass;
	
	public CustomerModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerModel(Long maKH, String hoTen, String diaChi, String soDT, String email, String userName,
			String pass) {
		super();
		MaKH = maKH;
		HoTen = hoTen;
		DiaChi = diaChi;
		SoDT = soDT;
		Email = email;
		UserName = userName;
		Pass = pass;
	}
	
	public Long getMaKH() {
		return MaKH;
	}

	public void setMaKH(Long maKH) {
		MaKH = maKH;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getSoDT() {
		return SoDT;
	}

	public void setSoDT(String soDT) {
		SoDT = soDT;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getPass() {
		return Pass;
	}

	public void setPass(String pass) {
		Pass = pass;
	}

}
