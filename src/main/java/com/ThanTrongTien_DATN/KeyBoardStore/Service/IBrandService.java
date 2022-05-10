package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.BrandModel;

public interface IBrandService<T> {

	public List<BrandModel> getThuonghieu();

	public int addBrand(String math, String tenth);

	public int deleteBrand(String math);

	public int editBrand(String math, String tenth);

	public BrandModel getMotTH(String math);


}
