package com.pan.car.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.pan.car.dao.StateDao;
import com.pan.car.model.StateModel;

@Service
public class StateService {
	@Resource
	private StateDao dao;
	
	
	
	/**
	 * 
	 * @param model 新增的状态
	 * @return 数据库处理的结果
	 */
	public boolean add(StateModel model) {
		if (!check(model)) return false ;
		try {
			dao.addState(model);
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
	public boolean modify(StateModel model) {
		if (model.getId() == null)
			return false;
		try {
			dao.modifyState(model);
			return true;
		} catch (Exception e) {
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
			dao.delState(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param userModel
	 *            传入分页的信息
	 * @return 客户列表
	 */
	public List<StateModel> list() {
		try {
			return dao.listState() ;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 * @return 数据校验
	 */
	private boolean check(StateModel model) {
		boolean b1 = checkStr(model.getStateName());
		if (b1) {
			return true;
		}
		return false;
	}
/**
 * 
 * @param str
 * @return 字符串非空判断
 */
	private boolean checkStr(String str) {
		if ("".equals(str) | str == null) {
			return false;
		}
		return true;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
