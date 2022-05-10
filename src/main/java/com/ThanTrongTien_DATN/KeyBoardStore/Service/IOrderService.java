package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderModel;

public interface IOrderService<T>  {
	
	public List<OrderModel> getDonHangChoXN(long makh);

	public List<OrderModel> getDonHangChoTT(long makh);

	public List<OrderModel> getDonHangDaTT(long makh);

	public List<OrderModel> getDonHangDaHuy(long makh);

	public int HuyDon(long madh);

	public int XacNhan(long madh);

	public int ThanhToan(long madh);

	public List<OrderModel> DonHangChoXN();

	public List<OrderModel> DonHangChoTT();

	public List<OrderModel> DonHangDaTT();

	public List<OrderModel> DonHangDaHuy();

	public OrderModel getDonHang(long madh);

	public int NhanHang(long madh);
}
