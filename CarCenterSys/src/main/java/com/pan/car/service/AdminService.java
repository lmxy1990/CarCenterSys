package com.pan.car.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.pan.car.dao.AdminDao;
import com.pan.car.model.AdminModel;

@Service
public class AdminService {
	@Resource
	private AdminDao dao;

	/**
	 * 
	 * @param model
	 *            新增数据
	 * @return 处理结果
	 */
	public boolean add(AdminModel model) {
		if (!check(model))
			return false;
		try {
			dao.addAdmin(model);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * @param 管理员用户名
	 * @return 管理员模型
	 */
	public AdminModel getAdmin(String name) {
		if (name == null | name == "")
			return null;
		try {
			return dao.selectAdmin(name);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param 需要修改的参数
	 * @return 数据库执行的结果
	 */
	public boolean modify(AdminModel adminModel) {
		if (adminModel.getId() == null)
			return false;
		if (adminModel.getAdminPassword() != adminModel.getAdminPasswordRepeat()) {
			return false;
		}
		modifyDate(adminModel);
		try {
			dao.modifyAdmin(adminModel);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param id
	 *            管理员数据库的主键
	 * @return 返回数据库处理的结果
	 */
	public boolean del(Integer id) {
		try {
			dao.delAdmin(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @return 管理员列表
	 */
	public List<AdminModel> listAdmin() {
		try {
			return dao.listAdmin();
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 * @return 数据校验
	 */
	private boolean check(AdminModel model) {
		boolean b1 = checkStr(model.getAdminName());
		boolean b2 = checkStr(model.getAdminPassword());
		if (b1 & b2 & model.getAdminPassword().equals(model.getAdminPasswordRepeat())) {
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
	 * 
	 * @param model
	 *            值覆盖
	 */
	private void modifyDate(AdminModel model) {
		if (!checkStr(model.getAdminName())) {
			model.setAdminName(null);
		}
		if (!checkStr(model.getAdminPassword())) {
			model.setAdminPassword(null);
		}
		if (!checkStr(model.getAdminRealName())) {
			model.setAdminRealName(null);
		}
	}

}
