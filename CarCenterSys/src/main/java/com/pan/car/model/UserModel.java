package com.pan.car.model;

import org.springframework.stereotype.Component;

@Component
public class UserModel {
	// id
	private Long id;
	// 起始数据
	private Long start;
	// 结束数据
	private Long end;
	private String userName;
	private String userPassword;
	private String userPasswordRepeat;
	private String userTel;
	//里程数
	private Integer userMile;
	//车牌号码
	private String userNo;
	//单位
	private String userUnit;
	// 当前页
	private Integer currentPage;
	// 总页
	private Integer pageSum;

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	
	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	
	public String getUserUnit() {
		return userUnit;
	}

	public void setUserUnit(String userUnit) {
		this.userUnit = userUnit;
	}

	public Integer getUserMile() {
		return userMile;
	}

	public void setUserMile(Integer userMile) {
		this.userMile = userMile;
	}

	public String getUserPasswordRepeat() {
		return userPasswordRepeat;
	}

	public void setUserPasswordRepeat(String userPasswordRepeat) {
		this.userPasswordRepeat = userPasswordRepeat;
	}

	public Long getStart() {
		return start;
	}

	public void setStart(Long start) {
		this.start = start;
	}

	public Long getEnd() {
		return end;
	}

	public void setEnd(Long end) {
		this.end = end;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSum() {
		return pageSum;
	}

	public void setPageSum(Integer pageSum) {
		this.pageSum = pageSum;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	
}
