package com.pan.car.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.pan.car.model.AdminModel;
import com.pan.car.service.AdminService;

/**
 * 
 * @author pan 该类作用为:操作管理员数据在该类下,而页面跳转都在通用类下.
 */
@Controller
public class AdminControl {
	@Resource
	private HttpServletRequest request;
	@Resource
	private AdminService service;
	@Resource
	private CommonControl control;

	/**
	 * 
	 * @param adminModel
	 *            用户登录模型
	 * @return 处理结果
	 */
	@RequestMapping(value = "admin/doLoad", method = RequestMethod.POST)
	public String doLoad(AdminModel adminModel) {
		if (adminModel.getAdminName() == null | adminModel.getAdminName() == "") {
			request.setAttribute("info_admin", "请输入账号!");
			return control.adminLoad();
		}
		AdminModel model = service.getAdmin(adminModel.getAdminName());
		if (model == null) {
			request.setAttribute("info_admin", "账号不存在");
			return control.adminLoad();
		}
		if (!model.getAdminPassword().equals(adminModel.getAdminPassword())) {
			request.setAttribute("info_admin", "账号密码错误");
			return control.adminLoad();
		}
		request.getSession().setAttribute("admin", model);
		return control.adminIndex();
	}

	/**
	 * 
	 * @param model
	 *            传入的参数
	 * @return 是否新增成功
	 */
	@RequestMapping(value = "admin/do_add_admin", method = RequestMethod.POST)
	public String addAdmin(AdminModel model) {
		// 权限判断
		if (control.checkPower()) {
			if (service.add(model)) {
				request.setAttribute("admin_info", "新增成功");
			} else {
				request.setAttribute("admin_info", "新增失败");
			}
		}
		return control.addAdmin();
	}

	/**
	 * 
	 * @param model
	 *            传入需要修改的模型
	 * @return 修改页面 该Controller有两层校验,第一层检测是否为超级管理员,如果是直接变更传入的模型.
	 *         如果不是,判断需要修改的用户是否是管理员本身,如果是,执行修改,不是提示权限不足!
	 */
	@RequestMapping(value = "admin/modify_admin", method = RequestMethod.POST)
	public String modify(AdminModel model) {
		// 权限判断
		if (control.checkPower()) {
			if (service.modify(model)) {
				request.setAttribute("admin_info", "修改成功");
			} else {
				request.setAttribute("admin_info", "修改失败");
			}
			// 非超级管理员只容许修改自己信息
		} else {
			try {
				Integer bool = ((AdminModel) request.getSession().getAttribute("admin")).getId();
				// 管理员信息变更判断
				if (bool == model.getId()) {
					if (service.modify(model)) {
						request.setAttribute("admin_info", "修改成功");
					} else {
						request.setAttribute("admin_info", "修改失败");
					}
				} else {
					request.setAttribute("admin_info", "权限不足");
				}
			} catch (Exception e) {
			}
		}
		return control.adminInfo();
	}

	/**
	 * 
	 * @param id
	 *            需要删除的管理员主键
	 * @return
	 */
	@RequestMapping(value = "admin/del_admin")
	public String delAdmin(Integer id) {
		// 防止删除自己
		Integer bool;
		try {
			bool = ((AdminModel) request.getSession().getAttribute("admin")).getAdminPower();
		} catch (Exception e) {
			bool = 0;
		}
		if (bool != 0 & bool != id) {
			if (control.checkPower()) {
				if (service.del(id)) {
					request.setAttribute("admin_info", "删除成功");
				} else {
					request.setAttribute("admin_info", "删除失败");
				}
			} else {
				request.setAttribute("admin_info", "权限不足");
			}
		} else {
			request.setAttribute("admin_info", "不能删除自己!!!");
		}
		return control.adminInfo();
	}


}
