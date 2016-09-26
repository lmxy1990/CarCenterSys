package com.pan.car.control;

import java.math.BigDecimal;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.pan.car.model.ConsumeModel;
import com.pan.car.model.UserModel;
import com.pan.car.service.ConsumeService;
import com.pan.car.service.ServiceService;
import com.pan.car.service.StateService;
import com.pan.car.service.UserService;

@Controller
public class UserControl {
	@Resource
	private CommonControl control;
	@Resource
	private HttpServletRequest request;
	@Resource
	private UserService service;
	@Resource
	private UserModel thisModel;
	@Resource
	private ConsumeService consumeService;
	@Resource
	private ServiceService serviceService;
	@Resource
	private ConsumeModel thisConsumeModel;
	@Resource
	private StateService stateService;

	/**
	 * 管理员客户新增
	 */
	@RequestMapping(value = "user/do_add_user", method = RequestMethod.POST)
	public String addUser(UserModel userModel) {
		if (control.checkAdmin()) {
			if (service.add(userModel)) {
				request.setAttribute("user_info", "新增成功");
			} else {
				request.setAttribute("user_info", "新增失败");
			}
		} else {
			request.setAttribute("user_info", "权限不足");
		}
		return control.addUser();
	}

	/**
	 * 管理员对客户信息变更
	 */
	@RequestMapping(value = "admin/do_user_modify", method = RequestMethod.POST)
	public String modify(UserModel model) {
		// 服务器端校验权限
		if (control.checkPower()) {
			// service处理
			if (service.modify(model)) {
				request.setAttribute("user_info", "修改成功");
			} else {
				request.setAttribute("user_info", "修改失败");
			}
		} else {
			request.setAttribute("user_info", "权限不足");
		}
		return selectByFind(model);
	}

	/**
	 * 管理员对客户删除
	 */
	@RequestMapping(value = "admin/do_del_user")
	public String delUser(Long id) {
		// 服务器端权限校验
		if (control.checkPower()) {
			// service处理
			if (service.del(id)) {
				request.setAttribute("user_info", "删除成功");
			} else {
				request.setAttribute("user_info", "删除失败");
			}
		} else {
			request.setAttribute("user_info", "权限不足");
		}
		return control.userModify();
	}

	/**
	 * 用户管理界面
	 */
	@RequestMapping(value = "admin/user_page")
	public String listPage(Integer page) {
		thisModel.setCurrentPage(page);
		// 服务器端管理员验证
		if (control.checkAdmin()) {
			// 列出用户
			request.setAttribute("user_list", service.listUser(thisModel));
			// 将当前页面信息保存到请求中
			request.setAttribute("user_pages", thisModel);
		} else {
			request.setAttribute("user_info", "权限不足");
		}
		return control.userModify();
	}

	// 根据帐号或者用户名模糊查询用户
	@RequestMapping(value = "admin/find_user", method = RequestMethod.POST)
	public String selectByFind(UserModel model) {
		// 权限检查
		if (control.checkAdmin()) {
			if (model != null) {
				request.setAttribute("user_list", service.selectUserByFind(model));
			}
		} else {
			request.setAttribute("user_info", "权限不足");
		}
		return control.userModify();
	}

	// ************************************************************用户响应***************************************************************************************/
	/**
	 * 用户自己对自己的信息变更
	 */
	@RequestMapping(value = "user/do_modify_user", method = RequestMethod.POST)
	public String modifyByOwn(UserModel model) {
		// 服务器端权限校验
		if (control.checkUser(model.getId())) {
			// service处理
			if (service.modify(model)) {
				request.setAttribute("user_info", "修改成功");
			} else {
				request.setAttribute("user_info", "修改失败");
			}
		} else {
			request.setAttribute("user_info", "权限不足");
		}
		return "";
	}

	/**
	 * 客户注册
	 */
	@RequestMapping(value = "user/do_user_register", method = RequestMethod.POST)
	public String addRegister(UserModel userModel) {
		// 密码校验
		if (userModel.getUserPassword() != null
				& userModel.getUserPassword().equals(userModel.getUserPasswordRepeat())) {
			if (service.add(userModel)) {
				// 查询用户,并保存到session
				request.getSession().setAttribute("user", service.findUser(userModel.getUserName()));
				// 传入能预订的服务list
				request.setAttribute("service_list", serviceService.listByClass(1));
				request.setAttribute("register_info", "注册成功,请登录!");
			} else {
				request.setAttribute("register_info", "注册失败");
			}
		} else {
			request.setAttribute("register_info", "密码不一致");
		}
		return control.Index();
	}

	/**
	 * 客户登录
	 */
	@RequestMapping(value = "user/do_user_login")
	public String userLoad(UserModel model) {
		// 用户名校验
		if (!service.checkStr(model.getUserName())) {
			request.setAttribute("load_info", "用户名不能有特殊符号!");
			return "user/error_info";
		}
		UserModel userModel = service.findUser(model.getUserName());
		if (userModel == null) {
			request.setAttribute("load_info", "用户名错误!");
			return "user/error_info";
		}
		// 密码校验
		if (!service.checkStr(model.getUserPassword())) {
			request.setAttribute("load_info", "密码不能有特殊符号!");
			return "user/error_info";
		}
		if (!userModel.getUserPassword().equals(model.getUserPassword())) {
			request.setAttribute("load_info", "密码错误!");
			return "user/error_info";
		}
		// 保存查询到的用户模型到session中
		request.getSession().setAttribute("user", userModel);
		// 传入能预订的服务list
		request.setAttribute("service_list", serviceService.listByClass(1));
		return control.Index();
	}

	/**
	 * 客户预约服务
	 */
	@RequestMapping(value = "user/user_do_reserve", method = RequestMethod.POST)
	public String userDoReserve(ConsumeModel model) {
		// 判断用户预约的用户是否是自己,不是自己直接退出登录
		if (control.checkUser(model.getUserId())) {
			// 设置预约的一些参数
			model.setAdminId(1);
			model.setStateId(1);
			model.setRealPrice(new BigDecimal(0));
			consumeService.add(model);
		} else {
			request.setAttribute("load_info", "参数校验错误,请不要修改客户端参数!");
			return userExit();
		}
		return control.Index();
	}

	/**
	 * 我的订单
	 */
	@RequestMapping(value = "user/user_order")
	public String myOrder(ConsumeModel model) {
		Long userId = null;
		String userName = null;
		Integer page = null;
		Integer stateId = null;
		// 取值
		try {
			String userIdStr = request.getParameter("userId");
			userName = request.getParameter("userName");
			String pageStr = request.getParameter("page");
			String stateIdStr = request.getParameter("stateId");
			if (userIdStr != null & userIdStr != "") {
				userId = Long.valueOf(userIdStr);
			}
			if (pageStr != null & pageStr != "") {
				page = Integer.valueOf(pageStr);
			}
			if (stateIdStr != null & stateIdStr != "") {
				stateId = Integer.valueOf(stateIdStr);
			}
		} catch (Exception e) {
			request.setAttribute("order_info", "传参错误");
			return "admin/show_order";
		}
		// 服务器端校验查询用户订单的id
		if (control.checkUser(model.getUserId())) {
			thisConsumeModel.setUserId(userId);
			thisConsumeModel.setUserName(userName);
			thisConsumeModel.setPage(page);
			thisConsumeModel.setStateId(stateId);
			// 将查询的信息保存到请求中
			request.setAttribute("consume_list", consumeService.find(thisConsumeModel));
			// 传入服务状态状态
			request.setAttribute("state_list", stateService.list());
			// 将查询信息保存到请求中
			request.setAttribute("user_order_info", thisConsumeModel);
		} else {
			request.setAttribute("load_info", "参数校验错误,请不要修改客户端参数!");
			return userExit();
		}
		return "user/show_order";
	}

	/**
	 * 退出
	 */
	@RequestMapping(value = "user/user_exit")
	public String userExit() {
		try {
			request.getSession().removeAttribute("user");
		} catch (Exception e) {
		}
		return control.Index();
	}

}
