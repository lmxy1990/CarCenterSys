package com.pan.car.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.pan.car.dao.ServiceDao;
import com.pan.car.model.ServiceModel;

@Service
public class ServiceService {
	@Resource
	private ServiceDao dao;

	/**
	 * 
	 * @param model
	 *            新增的用户
	 * @return 数据库处理的结果
	 */
	public boolean add(ServiceModel model) {
		if (!check(model))
			return false;
		try {
			dao.addService(model);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param model
	 *            需要修改的模型
	 * @return 修改的结果
	 */
	public boolean modify(ServiceModel model) {
		if (model.getId() == null)
			return false;
		modifyDate(model);
		try {
			System.out.println("===================");
			dao.modifyService(model);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	 * @param id
	 *            数据库的主键
	 * @return 返回数据库处理的结果
	 */
	public boolean del(Integer id) {
		try {
			dao.delService(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param userModel
	 * @return 客户列表
	 */
	public List<ServiceModel> list() {
		try {
			return dao.listService();
		} catch (Exception e) {
			return null;
		}
	}
	/**
	 * 
	 * @param canReserve 1查询能预定的服务,0查询不能预订的服务
	 * @return 服务的集合
	 */
	public List<ServiceModel> listByClass(Integer canReserve) {
		try {
			return dao.listServiceByClass(canReserve) ;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 * @return 数据校验
	 */
	private boolean check(ServiceModel model) {
		boolean b1 = checkStr(model.getServiceName());
		if (model.getServicePrice() == null)
			return false;
		if (b1) {
			return true;
		}
		return false;
	}

	private boolean checkStr(String str) {
		if ("".equals(str) | str == null) {
			return false;
		}
		return true;
	}

	/**
	 * 空值覆盖
	 */
	private void modifyDate(ServiceModel model) {
		if (!checkStr(model.getServiceName())) {
			model.setServiceName(null);
		}
		if (!checkStr(model.getServiceDescribe())) {
			model.setServiceDescribe(null);
		}

	}

}
