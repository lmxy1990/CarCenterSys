package com.pan.car.model;

import org.springframework.stereotype.Component;

@Component
public class AdminModel {
	private Integer id;
	private String adminName;
	private String adminPassword;
	private String adminPasswordRepeat;
	private String adminRealName;
	private Integer adminPower;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminRealName() {
		return adminRealName;
	}

	public void setAdminRealName(String adminRealName) {
		this.adminRealName = adminRealName;
	}

	public Integer getAdminPower() {
		return adminPower;
	}

	public void setAdminPower(Integer adminPower) {
		this.adminPower = adminPower;
	}

	public String getAdminPasswordRepeat() {
		return adminPasswordRepeat;
	}

	public void setAdminPasswordRepeat(String adminPasswordRepeat) {
		this.adminPasswordRepeat = adminPasswordRepeat;
	}

}
