package com.pan.car.model;

/**
 * 该模型是用于统计消费的
 */
public class StatisticsModel {
	//总消费金额
	private Long sumMoney ;
	//总消费次数
	private Long countOrder ;
	
	
	
	
	public Long getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(Long sumMoney) {
		this.sumMoney = sumMoney;
	}
	public Long getCountOrder() {
		return countOrder;
	}
	public void setCountOrder(Long countOrder) {
		this.countOrder = countOrder;
	}
	
}
