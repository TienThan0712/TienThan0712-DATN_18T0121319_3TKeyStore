package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductCommentModel;

public interface IProductCommentService<T> {

	public List<ProductCommentModel> getComment();

	public int addComment(String MaSP, Long MaKhachHang, String NoiDung);

	public void deletecache();

	public List<ProductCommentModel> getCommentProduct(String maloai);

	public int Delete(long maComment);

}
