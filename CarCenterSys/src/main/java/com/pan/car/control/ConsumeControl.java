package com.pan.car.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pan.car.model.ConsumeModel;
import com.pan.car.model.UserModel;
import com.pan.car.service.ConsumeService;
import com.pan.car.service.StateService;

@Controller
public class ConsumeControl {
	@Resource
	private HttpServletRequest request;
	@Resource
	private ConsumeService service;
	@Resource
	private CommonControl control;
	@Resource
	private UserControl userControl;
	@Resource
	private ConsumeModel thisConsumeModel;
	@Resource
	private UserModel thisUserModel;
	@Resource
	private StateService stateService ;
	
	
	
	
	
	
	
	
	/**
	 * 管理员新增消费记录
	 */
	@RequestMapping(value = "admin/do_add_order", method = RequestMethod.POST)
	public String doAddOrder(ConsumeModel model) {
		// 权限判断
		if (control.checkAdmin()) {
			if (service.add(model)) {
				request.setAttribute("order_info", "新增成功");
			} else {
				request.setAttribute("order_info", "新增失败");
			}
		} else {
			request.setAttribute("order_info", "权限不足");
		}
		return slectUser(service.getuser(model.getUserId()));
	}

	/**
	 * 根据用户名,车牌号
	 */
	@RequestMapping(value = "admin/order_select_user", method = RequestMethod.POST)
	public String slectUser(UserModel model) {
		userControl.selectByFind(model);
		return control.addOrder();
	}

	/**
	 * 查询全部用户
	 */
	@RequestMapping(value = "admin/order_select_all_user")
	public String slectUserAll(Integer page) {
		userControl.listPage(page);
		return control.addOrder();
	}

	/**
	 * 消费明细页面用户查询
	 */
	@RequestMapping(value = "admin/do_order_detial_user", method = RequestMethod.POST)
	public String slectUserOrder(UserModel model) {
		userControl.selectByFind(model);
		return control.orderInfo();
	}

	/**
	 * 消费明细页面查询全部用户
	 */
	@RequestMapping(value = "admin/do_order_detial_all_user")
	public String slectUserAllOrder(Integer page) {
		userControl.listPage(page);
		return control.orderInfo();
	}

	/**
	 * 根据用户的id/状态查询他所产生的消费记录
	 */
	@RequestMapping(value = "admin/do_find_consume")
	public String findUserconsume() {
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
		// 后台权限校验
		if (control.checkAdmin()) {
			thisConsumeModel.setUserId(userId);
			thisConsumeModel.setUserName(userName);
			thisConsumeModel.setPage(page);
			thisConsumeModel.setStateId(stateId);
			try {
				// 将查询的信息保存到请求中
				request.setAttribute("consume_list", service.find(thisConsumeModel));
				//传入服务状态状态
				request.setAttribute("state_list", stateService.list());
			} catch (Exception e) {
				request.setAttribute("consume_list", null);
			}
			// 将查询信息保存到请求中
			request.setAttribute("page_info", thisConsumeModel);
		} else {
			request.setAttribute("order_info", "权限不足");
		}
		return "admin/show_order";
	}

	/**
	 * 删除消费记录
	 */
	@RequestMapping(value = "admin/del_consume")
	public String del() {
		// 参数
		String idStr = request.getParameter("id");
		if (idStr == null | idStr == "") {
			request.setAttribute("show_info", "找不到必要的参数");
			return "admin/show_order";
		}
		Long id = null;
		try {
			id = Long.valueOf(idStr);
		} catch (Exception e) {
			request.setAttribute("show_info", "参数不是数值");
			return "admin/show_order";
		}
		// 超级管理员权限
		if (control.checkPower()) {
			if (service.del(id)) {
				request.setAttribute("show_info", "删除成功");
			} else {
				request.setAttribute("show_info", "删除失败");
			}
		}
		return findUserconsume();
	}

	/**
	 * 查询预约信息
	 */
	@RequestMapping(value = "admin/reserve_info")
	public String reserveInfo(Integer page) {
		thisConsumeModel.setPage(page);
		// 设置服务表,状态表表
		control.addOrder();
		// 保存预约信息到request
		request.setAttribute("reserve_info", service.selectReserve(thisConsumeModel));
		// 保存分页信息
		request.setAttribute("page_info", thisConsumeModel);
		return "admin/reserve_info";
	}

	/**
	 * 在修订单列表页面
	 */
	@RequestMapping(value = "admin/repair_list")
	public String repairListPage() {
		// 设置必要的参数
		control.addOrder();
		request.setAttribute("repair_list", service.selectRepair());
		return "admin/repair_list";
	}

	/**
	 * 在修订单结算
	 */
	@RequestMapping(value = "admin/settlement_order", method = RequestMethod.POST)
	public String settlement(ConsumeModel model) {
		// 设置id
		model.setId(null);
		// 修改在修订单
		model.setStateIdOld(2);
		// 修改为已完成
		model.setStateId(3);
		if (service.modify(model)) {
			request.setAttribute("settlement_info", "结算成功");
		} else {
			request.setAttribute("settlement_info", "结算失败");
		}
		return repairListPage();
	}

	/**
	 * 在修订单页面添加服务
	 */
	@RequestMapping(value = "admin/repair_add", method = RequestMethod.POST)
	public String repairAddService(ConsumeModel model) {
		if (service.add(model)) {
			request.setAttribute("settlement_info", "添加成功");
		} else {
			request.setAttribute("settlement_info", "添加失败");
		}
		return repairListPage();
	}

	/**
	 * 显示在修订单详情页面
	 */
	@RequestMapping(value = "admin/repair_details")
	public String repairDetials() {
		// 获取数据
		Long userId = null;
		String userName = null;
		Integer page = null;
		try {
			String userIdStr = request.getParameter("userId");
			userName = request.getParameter("userName");
			String pageStr = request.getParameter("page");
			if (userIdStr != null & userIdStr != "") {
				userId = Long.valueOf(userIdStr);
			}
			if (pageStr != null & pageStr != "") {
				page = Integer.valueOf(pageStr);
			}
		} catch (Exception e) {
			request.setAttribute("order_info", "传参错误");
			return "admin/show_order";
		}
		// 数据处理
		// 后台权限校验
		if (control.checkAdmin()) {
			thisConsumeModel.setUserId(userId);
			thisConsumeModel.setUserName(userName);
			thisConsumeModel.setPage(page);
			// 固定查询在修订单
			thisConsumeModel.setStateId(2);
			try {
				// 将查询的信息保存到请求中
				request.setAttribute("consume_list", service.find(thisConsumeModel));
			} catch (Exception e) {
				request.setAttribute("consume_list", null);
			}
			// 将查询信息保存到请求中
			request.setAttribute("page_info", thisConsumeModel);
		} else {
			request.setAttribute("order_info", "权限不足");
		}

		return "admin/repair_details";
	}

	/**
	 * 修理界面删除
	 */
	@RequestMapping(value = "admin/repair_del")
	public String repairDel() {
		del();
		return repairDetials();
	}

	/**
	 * json处理,获取预定数目
	 */
	@RequestMapping(value = "json/getReserveSum.html")
	@ResponseBody
	public String getReserveSum() {
		return service.getReserveCount().toString();
	}
	/**
	 * 详情页面修改订单信息
	 */
	public String modifyOrder(){
		
		
		return repairDetials() ;
	}
	
	
}
