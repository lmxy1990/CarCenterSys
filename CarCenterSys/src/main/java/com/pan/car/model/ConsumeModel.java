package com.pan.car.model;

import java.math.BigDecimal;
import org.springframework.stereotype.Component;

@Component
public class ConsumeModel {
	// 序号
	private Integer id;
	// 用户外键
	private Long userId;
	// 服务外键
	private Integer serviceId;
	// 管理员外键
	private Integer adminId;
	// 状态外键
	private Integer stateId;
	// 原状态
	private Integer stateIdOld;
	// 页码起始
	private Long start;
	// 页码数据
	private Integer end;
	// 客户名
	private String userName;
	// 服务名
	private String serviceName;
	// 管理名
	private String adminName;
	// 状态
	private String stateName;
	// 备注
	private String remarks;
	// 订单产生时间
	private String consumeTime;
	// 实际价格
	private BigDecimal realPrice;
	// 页面
	private Integer page;
	// 总消费金额
	private Long sumMoney;
	// 总消费次数
	private Long countOrder;
	// 页面总数
	private Integer pageSum;
	//用户车牌号
	private String userNo ;
	
	
	
	
	
	
	
	
	
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getServiceId() {
		return serviceId;
	}

	public void setServiceId(Integer serviceId) {
		this.serviceId = serviceId;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public Integer getStateId() {
		return stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	public Long getStart() {
		return start;
	}

	public void setStart(Long start) {
		this.start = start;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getConsumeTime() {
		return consumeTime;
	}

	public void setConsumeTime(String consumeTime) {
		this.consumeTime = consumeTime;
	}

	public BigDecimal getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(BigDecimal realPrice) {
		this.realPrice = realPrice;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

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

	public Integer getPageSum() {
		return pageSum;
	}

	public void setPageSum(Integer pageSum) {
		this.pageSum = pageSum;
	}

	public Integer getStateIdOld() {
		return stateIdOld;
	}

	public void setStateIdOld(Integer stateIdOld) {
		this.stateIdOld = stateIdOld;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

}
