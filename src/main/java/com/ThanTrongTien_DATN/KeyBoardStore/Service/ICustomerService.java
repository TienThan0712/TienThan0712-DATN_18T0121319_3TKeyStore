package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;

public interface ICustomerService<T> {
	
	public CustomerModel ktdn(String tendn);
	
	public boolean isisAccountExists(String tendn);

	public int ktdk(String hoten, String diachi, String sodt, String email, String mk);

	public int SuaThongTin(long makh, String hoten, String diachi, String sodt, String email);

	public CustomerModel LayThongTin(long makh);

	public int DoiMK(long makh, String mkmoi);

	public List<CustomerModel> getKH();

	public int Block(long makh);
	
	public int Active(long makh);

	public int ResetPassword(String Email);

	public int CheckUser(String Email);

	
}
