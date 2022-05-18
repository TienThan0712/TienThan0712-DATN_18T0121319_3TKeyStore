package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;

public interface ICategoryService<T> {
	public List<T> getLoai();

	public int addCategory(String maloai, String tenloai);

	public int deleteCategory(String maloai);

	public int editCategory(String maloai, String tenloai);

	public CategoryModel getMotLoai(String maloai);

	void deletecache();
}
