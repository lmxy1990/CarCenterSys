package com.pan.car.model;

import java.math.BigDecimal;
import org.springframework.stereotype.Component;

@Component
public class ServiceModel {
	private Integer id;
	private String serviceName;
	private BigDecimal servicePrice;
	private Integer canReserve;
	private String serviceDescribe;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public BigDecimal getServicePrice() {
		return servicePrice;
	}

	public void setServicePrice(BigDecimal servicePrice) {
		this.servicePrice = servicePrice;
	}


	public Integer getCanReserve() {
		return canReserve;
	}

	public void setCanReserve(Integer canReserve) {
		this.canReserve = canReserve;
	}

	public String getServiceDescribe() {
		return serviceDescribe;
	}

	public void setServiceDescribe(String serviceDescribe) {
		this.serviceDescribe = serviceDescribe;
	}
}
