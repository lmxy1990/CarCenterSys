package com.pan.car.model;

import java.math.BigDecimal;

public class RepairModel {
	//用户id
	private Long userId ;
	//用户名
	private String userName ;
	//正在修的项目数
	private Integer repairCount ;
	//应收金额
	private BigDecimal costMoney ;
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getRepairCount() {
		return repairCount;
	}
	public void setRepairCount(Integer repairCount) {
		this.repairCount = repairCount;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public BigDecimal getCostMoney() {
		return costMoney;
	}
	public void setCostMoney(BigDecimal costMoney) {
		this.costMoney = costMoney;
	}
	
}
