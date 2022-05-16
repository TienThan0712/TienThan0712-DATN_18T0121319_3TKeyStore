package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueDayModel;

public interface IRevenueDayService<T> {

	public List<RevenueDayModel> getRevenueDay(String month);

}
