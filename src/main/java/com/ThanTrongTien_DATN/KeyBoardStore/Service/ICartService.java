package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CartModel;

public interface ICartService<T> {
	public void Them(String masp, String anhsp, String tensp, Long gia, Long soLuong);

	public void Sua(String masp, long sl);

	public Long TongTien();

	public Long SoSP();

	public void Xoa(String masp);

	public void XoaALL();

	public int themHoaDondao(Long makh,Long total,String PTTT);

	public int themCTHDdao(long mahd, String masp, long soluong,  long thanhtien);

	public void themCTHD(List<CartModel> dsgiohang, long maHD);

	public long maHDVuaTao();
}
