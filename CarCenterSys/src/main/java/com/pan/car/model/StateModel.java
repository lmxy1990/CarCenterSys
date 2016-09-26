package com.pan.car.model;

import org.springframework.stereotype.Component;

@Component
public class StateModel {
	private Integer id;
	private String stateName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
}
