package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.Date;
import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;

public interface IProductService<T> {
	public List<T> getsp();
	public List<T> getspmoi();
	public List<T> get8spmoi();
	public List<T> getsphot();
	public List<T> get8sphot();
	public ProductModel get1sp(String masanpham);
	public int addProduct(String MaSP, String AnhSP, String TenSP, Long DonGia, Integer GiamGia, String MaLoai,String MaSwitch , java.util.Date NgayThem,String MoTa);
	public int deleteProduct(String masp);
	public int editProductInfo(String MaSP, String AnhSP, String TenSP, Long DonGia, Integer GiamGia, String MaLoai,String MaSwitch , Date NgayThem, String MoTa);
	public int editProductInfoNotImage(String MaSP, String TenSP, Long DonGia, Integer GiamGia, String MaLoai,String MaSwitch , Date NgayThem, String MoTa);
	public List<ProductModel> getCategory(String MaLoai);
	public List<ProductModel> search(String Key);
	public List<ProductModel> get8Category(String MaLoai);
	public List<ProductModel> searchBuFilter(List<ProductModel> product, String maThuongHieu, String maSwitch, String giaSP);
	void deletecache();
}
