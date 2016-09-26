package com.pan.car.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.pan.car.model.ServiceModel;
import com.pan.car.service.ServiceService;

@Controller
public class ServiceControl {
	@Resource
	private CommonControl control;
	@Resource
	private ServiceService service;
	@Resource
	private HttpServletRequest request;

	/**
	 * 服务的新增,数据校验在service层
	 */
	@RequestMapping(value = "admin/do_add_service", method = RequestMethod.POST)
	public String addService(ServiceModel model) {
		if (service.add(model)) {
			request.setAttribute("service_info", "新增成功");
		} else {
			request.setAttribute("service_info", "新增失败");
		}
		return control.addService();
	}

	/**
	 * 修改服务的信息
	 */
	@RequestMapping(value = "admin/do_service_modify", method = RequestMethod.POST)
	public String modifyService(ServiceModel model) {
		if (model.getServiceDescribe().length() > 100) {
			request.setAttribute("service_info", "描述超过最大值");
			return control.serviceInfo();
		}
		if (service.modify(model)) {
			request.setAttribute("service_info", "修改成功");
		} else {
			request.setAttribute("service_info", "修改失败");
		}
		return control.serviceInfo();
	}

	/**
	 * 删除服务信息
	 */
	@RequestMapping(value = "admin/del_service",method = RequestMethod.GET)
	public String delService(Integer id) {
		if (id == null) {
			request.setAttribute("service_info", "参数错误");
		}
		if (service.del(id)){
			request.setAttribute("service_info", "删除成功");
		}else {
			request.setAttribute("service_info", "删除失败");
		}
		return control.serviceInfo();
	}

}
