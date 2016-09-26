package com.pan.car.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pan.car.model.AdminModel;
import com.pan.car.model.UserModel;
import com.pan.car.service.AdminService;
import com.pan.car.service.ServiceService;
import com.pan.car.service.StateService;
import com.pan.car.service.UserService;

/**
 * 
 * @author pan 公共控制层,主要作用是实现各个页面的切换.
 */
@Controller
public class CommonControl {
	@Resource
	private HttpServletRequest request;
	@Resource
	private AdminService adminService;
	@Resource
	private UserService userService;
	@Resource
	private UserModel userModel;
	@Resource
	private ServiceService serviceService;
	@Resource
	private StateService stateService;

	/**
	 * 进入管理员界面
	 * 
	 * @return 管理员界面
	 */
	@RequestMapping(value = "admin/adminPage")
	public String adminIndex() {
		return "admin/admin_page";
	}

	/**
	 * 
	 * @return 管理员登陆页面路径
	 */
	@RequestMapping(value = "admin/adminLoad")
	public String adminLoad() {
		return "admin/admin_load";
	}

	/**
	 * 
	 * @return 首页
	 */
	@RequestMapping(value = "index")
	public String Index() {
		request.setAttribute("service_list", serviceService.listByClass(1));
		return "common/index";
	}

	/**
	 * 
	 * @return 添加管理员
	 */
	@RequestMapping(value = "admin/add_admin")
	public String addAdmin() {

		return "admin/add_admin";
	}

	/***
	 * 
	 * @return 管理员信息管理
	 */
	@RequestMapping(value = "admin/admin_info")
	public String adminInfo() {
		try {
			Integer bool = ((AdminModel) request.getSession().getAttribute("admin")).getAdminPower();
			// 权限判断
			if (bool == 1) {
				request.setAttribute("admin_list", adminService.listAdmin());
			}
		} catch (Exception e) {
		}
		return "admin/admin_info";
	}

	/**
	 * 
	 * @return 订单查询
	 */
	@RequestMapping(value = "admin/order_info")
	public String orderInfo() {

		return "admin/order_info";
	}

	/**
	 * 新增订单页面
	 */
	@RequestMapping(value = "admin/add_order")
	public String addOrder() {
		// 传入服务list
		request.setAttribute("service_list", serviceService.list());
		// 传入状态list
		request.setAttribute("state_list", stateService.list());
		return "admin/add_order";
	}

	/**
	 * 
	 * @return 新增服务
	 */
	@RequestMapping(value = "admin/add_service")
	public String addService() {

		return "admin/add_service";
	}

	/**
	 * 用户管理
	 */
	@RequestMapping(value = "admin/user_info")
	public String userModify() {
		return "admin/user_info";
	}

	/**
	 * 新增用户界面
	 */
	@RequestMapping(value = "admin/add_user")
	public String addUser() {
		return "admin/add_user";
	}

	/**
	 * 
	 * @return 服务管理
	 */
	@RequestMapping(value = "admin/service_info")
	public String serviceInfo() {
		request.setAttribute("service_list", serviceService.list());
		return "admin/service_info";
	}

	/**
	 * @return 退出系统
	 */
	@RequestMapping(value = "admin/exit_system")
	public String exitSystem() {
		request.getSession().removeAttribute("admin");
		return "admin/admin_page";
	}

	/**
	 * 
	 * @return 框架首页展示
	 */
	@RequestMapping(value = "admin/admin_index")
	public String adminIndexi() {
		return "admin/admin_index";
	}

	/**
	 * 
	 * @return 是否为超级管理员
	 */
	public boolean checkPower() {
		try {
			Integer bool = ((AdminModel) request.getSession().getAttribute("admin")).getAdminPower();
			if (bool == 1) {
				return true;
			} else {
				request.setAttribute("admin_info", "权限不足");
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 校验用户,传入信息变更的id,与客户自己的id比较
	 */
	public boolean checkUser(Long id) {
		try {
			Long bool = ((UserModel) request.getSession().getAttribute("user")).getId();
			if (bool == id) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 检查是否是管理员
	 */
	public boolean checkAdmin() {
		try {
			Integer id = ((AdminModel) request.getSession().getAttribute("admin")).getId();
			if (id != null) {
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

}
