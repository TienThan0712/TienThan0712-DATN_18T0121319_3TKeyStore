package com.ThanTrongTien_DATN.KeyBoardStore.Model;

public class RevenueMonthModel {
	private Integer Month;
	private Long TotalPrice;
	public RevenueMonthModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RevenueMonthModel(Integer month, Long totalPrice) {
		super();
		Month = month;
		this.TotalPrice = totalPrice;
	}
	public Integer getMonth() {
		return Month;
	}
	public void setMonth(Integer month) {
		Month = month;
	}
	public Long getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.TotalPrice = totalPrice;
	}
	

}
