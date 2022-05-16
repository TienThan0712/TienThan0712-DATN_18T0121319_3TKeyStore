package com.ThanTrongTien_DATN.KeyBoardStore.Service;

import java.util.List;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;

public interface ISwitchService<T> {

	public List<SwitchModel> getSwitch();

	public int addSwitch(String math, String tenth);

	public int deleteSwitch(String math);

	public int editSwitch(String math, String tenth);

	public SwitchModel getMotSwitch(String math);

	public void clearCatche();


}
