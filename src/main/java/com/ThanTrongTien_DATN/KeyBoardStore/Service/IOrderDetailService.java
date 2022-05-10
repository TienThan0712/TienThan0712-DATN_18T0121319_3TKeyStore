package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderDetailModel;

public interface IOrderDetailService<T> {
	public List<OrderDetailModel> getCTDH(long mahd);
}
