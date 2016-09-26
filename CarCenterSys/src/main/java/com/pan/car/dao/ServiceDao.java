package com.pan.car.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.pan.car.model.ServiceModel;

@Repository
public interface ServiceDao {
	public void addService(ServiceModel serviceModel) throws Exception;

	public void modifyService(ServiceModel serviceModel) throws Exception;

	public void delService(Integer id) throws Exception;

	public List<ServiceModel> listService() throws Exception;

	public List<ServiceModel> listServiceByClass(Integer canReserve) throws Exception;
}
