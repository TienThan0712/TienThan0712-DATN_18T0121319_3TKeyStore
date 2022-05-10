package com.ThanTrongTien_DATN.KeyBoardStore.Model;

public class AdminModel {
	private String UserName;
	private String Password;
	public AdminModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminModel(String userName, String password) {
		super();
		UserName = userName;
		Password = password;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
}
