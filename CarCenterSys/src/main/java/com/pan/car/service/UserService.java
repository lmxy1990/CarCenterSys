package com.pan.car.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.pan.car.dao.UserDao;
import com.pan.car.model.UserModel;

@Service
public class UserService {
	@Resource
	private UserDao dao;
	// 每一个页面用户数量
	private final Integer userNub = 10;

	/**
	 * 
	 * @param model
	 *            新增的用户
	 * @return 数据库处理的结果
	 */
	public boolean add(UserModel model) {
		if (!check(model))
			return false;
		if (model.getUserMile() > 500000)
			return false;
		modifyDate(model);
		try {
			dao.addUser(model);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param name
	 *            用户名
	 * @return 用户模型
	 */
	public UserModel findUser(String name) {
		if (name == null | name == "")
			return null;
		try {
			return dao.selectUser(name);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 *            需要修改的模型
	 * @return 修改的结果
	 */
	public boolean modify(UserModel model) {
		if (model.getId() == null)
			return false;
		modifyDate(model);
		// 空值直接返回
		if (model.getUserMile() == null & model.getUserNo() == null & model.getUserPassword() == null
				& model.getUserUnit() == null & model.getUserTel() == null) {
			return false;
		}
		// 里程数校验
		Integer max = 500000;
		Integer min = selectMileage(model.getId());
		if (min == null) {
			min = 0;
		}
		if (min < model.getUserMile() & model.getUserMile() < max) {
			try {
				dao.modifyUser(model);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		} else {
			return false;
		}
	}

	/**
	 * 
	 * @param id
	 *            数据库的主键
	 * @return 返回数据库处理的结果
	 */
	public boolean del(Long id) {
		try {
			dao.delUser(id);
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
	public List<UserModel> listUser(UserModel model) {
		// 设置页面数据
		setPage(model);
		try {
			return dao.listUser(model);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 根据传入的用户名/车牌号.来进行模糊查询
	 * 
	 */
	public List<UserModel> selectUserByFind(UserModel model) {
		// 数据校验
		modifyDate(model);
		if (checkStr(model.getUserName())) {
			try {
				model.setUserName("%" + model.getUserName() + "%");
				return dao.selectUserByFind(model);
			} catch (Exception e) {
				return null;
			}
		} else if (checkStr(model.getUserNo())) {
			try {
				model.setUserNo("%" + model.getUserNo() + "%");
				return dao.selectUserByFind(model);
			} catch (Exception e) {
				return null;
			}
		} else if (model.getId() != null) {
			try {
				return dao.selectUserByFind(model);
			} catch (Exception e) {
				return null;
			}
		}
		return null;
	}

	/**
	 * 获取用户总数
	 */
	public Integer getUserSum() {
		try {
			return dao.getUserSum();
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 * @return 数据校验
	 */
	private boolean check(UserModel model) {
		boolean b1 = checkStr(model.getUserName());
		boolean b2 = checkStr(model.getUserPassword());
		boolean b3 = checkStr(model.getUserNo());
		if (b1 & b2 & b3) {
			return true;
		}
		return false;
	}

	/**
	 *  检测有无特殊字符
	 */
	public boolean checkStr(String str) {
		String match = "\\p{Punct}";
		Pattern pattern = Pattern.compile(match);
		if ("".equals(str) | str == null) {
			return false;
		}
		if (pattern.matcher(str).find()) {
			return false;
		}
		return true;
	}

	/**
	 * 去除"" ,赋值为null
	 */
	private void modifyDate(UserModel model) {
		if (!checkStr(model.getUserName())) {
			model.setUserName(null);
		}
		if (!checkStr(model.getUserPassword())) {
			model.setUserPassword(null);
		}
		if (!checkStr(model.getUserPasswordRepeat())) {
			model.setUserPasswordRepeat(null);
		}
		if (!checkStr(model.getUserTel())) {
			model.setUserTel(null);
		}
		if (!checkStr(model.getUserNo())) {
			model.setUserNo(null);
		}
	}

	/**
	 * 分页信息转换设置
	 */
	private void setPage(UserModel model) {
		Integer currentPage = model.getCurrentPage();
		// 是否是初始查询
		if (currentPage == null) {
			model.setStart((long) 0);
			model.setEnd((long) 10);
			model.setCurrentPage(1);
			// 设置查询页面总数
			BigDecimal mg = new BigDecimal(getUserSum().intValue()).divide(new BigDecimal(userNub));
			Integer sum = (int) Math.ceil(mg.doubleValue());
			model.setPageSum(sum);
			return;
		} else {
			Long start = (long) ((currentPage - 1) * userNub - 1);
			Long end = userNub.longValue();
			if (start < 0) {
				start = (long) 0;
			}
			model.setStart(start);
			model.setEnd(end);
			// 设置查询页面总数
			Integer sum;
			if (getUserSum() != null) {
				BigDecimal mg = new BigDecimal(getUserSum().intValue()).divide(new BigDecimal(userNub));
				sum = (int) Math.ceil(mg.doubleValue());
			} else {
				sum = 1;
			}
			model.setPageSum(sum);
		}

	}

	/**
	 * 
	 * @param userId
	 *            用户id
	 * @return 行驶里程数
	 */
	public Integer selectMileage(Long userId) {
		if (userId == null) {
			return null;
		}
		try {
			return dao.selectMileage(userId);
		} catch (Exception e) {
			return null;
		}
	}

}
