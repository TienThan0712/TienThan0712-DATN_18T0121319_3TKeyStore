package com.ThanTrongTien_DATN.KeyBoardStore.Model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import javax.persistence.Cacheable;
import javax.persistence.Entity;

@RedisHash("switch")
public class SwitchModel implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String MaSwitch;
	private String TenSwitch;
	public SwitchModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SwitchModel(String maSwitch, String tenSwitch) {
		super();
		MaSwitch = maSwitch;
		TenSwitch = tenSwitch;
	}
	public String getMaSwitch() {
		return MaSwitch;
	}
	public void setMaSwitch(String maSwitch) {
		MaSwitch = maSwitch;
	}
	public String getTenSwitch() {
		return TenSwitch;
	}
	public void setTenSwitch(String tenSwitch) {
		TenSwitch = tenSwitch;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
