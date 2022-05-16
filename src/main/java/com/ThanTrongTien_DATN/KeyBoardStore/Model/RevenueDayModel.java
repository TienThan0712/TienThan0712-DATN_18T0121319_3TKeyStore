package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.util.Date;

public class RevenueDayModel {
	private Date Day;
	private Long totalPrice;
	public RevenueDayModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RevenueDayModel(Date day, Long totalPrice) {
		super();
		Day = day;
		this.totalPrice = totalPrice;
	}
	public Date getDay() {
		return Day;
	}
	public void setDay(Date day) {
		Day = day;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
