package com.pan.car.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.pan.car.dao.ConsumeDao;
import com.pan.car.model.ConsumeModel;
import com.pan.car.model.RepairModel;
import com.pan.car.model.StatisticsModel;
import com.pan.car.model.UserModel;

@Service
public class ConsumeService {
	@Resource
	private ConsumeDao dao;
	// 每页显示数据条数
	private final Integer count = 20;

	/**
	 * 在修订单查询
	 */
	public List<RepairModel> selectRepair() {
		// 设置订单状态为在修
		Integer stateId = 2;
		try {
			return dao.selectState(stateId);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 根据用户id/状态,查询他所产生记录的总金额,总条数
	 */
	public StatisticsModel getStatitics(ConsumeModel consumeModel) {
		try {
			return dao.getStatistics(consumeModel);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 查询预约的信息
	 */
	public List<ConsumeModel> selectReserve(ConsumeModel model) {
		// 设置查询状态是预定
		model.setStateId(1);
		// 分页设置
		setPage(model);
		// 设置总页数
		Integer pageSum = null;
		Long sum = getReserveCount();
		if (sum != null) {
			// 取整
			BigDecimal pageDouble = new BigDecimal(sum).divide(new BigDecimal(count));
			pageSum = (int) Math.ceil(pageDouble.doubleValue());
		}
		model.setPageSum(pageSum);
		try {
			return dao.selectConsumeByClass(model);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 查询预约信息的总数据
	 */
	public Long getReserveCount() {
		try {
			return dao.getReserveCount(1);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 
	 * @param model
	 *            新增的数据
	 * @return 数据库处理的结果
	 */
	public boolean add(ConsumeModel model) {
		if (!check(model))
			return false;
		// 日期时间转换
		dateModify(model);
		try {
			dao.addConsume(model);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 
	 * @param model
	 *            传入查询的用户名,以及分页信息
	 * @return 该用户下所有的消费数据
	 */
	public List<ConsumeModel> find(ConsumeModel model) {
		// 页面转换设置
		setPage(model);
		// 设置用户统计数据
		setMoney(model);
		try {
			return dao.selectConsumeByUser(model);
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
	public boolean modify(ConsumeModel model) {
		try {
			// 日期转换
			dateModify(model);
			dao.modifyConsume(model);
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
	public boolean del(Long id) {
		try {
			dao.delConsume(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 
	 * @param model
	 * @return 数据校验
	 */
	private boolean check(ConsumeModel model) {
		boolean b1 = model.getUserId() != null;
		boolean b2 = model.getServiceId() != null;
		boolean b3 = model.getAdminId() != null;
		boolean b4 = model.getUserId() != null;
		boolean b5 = model.getStateId() != null;
		boolean b6 = model.getConsumeTime() != null & model.getConsumeTime() != "";
		if (b1 & b2 & b3 & b4 & b5 & b6) {
			return true;
		}
		return false;
	}

	/**
	 * 分页信息转换设置
	 */
	private void setPage(ConsumeModel model) {
		Integer page = model.getPage();
		// 是否是初始查询
		if (page == null) {
			model.setStart((long) 0);
			model.setEnd(count);
			model.setPage(1);
		} else {
			Long start = (long) ((page - 1) * count - 1);
			if (start < 0) {
				start = (long) 0;
			}
			model.setStart(start);
			model.setEnd(count);
		}

	}

	/**
	 * 设置用户的统计数据
	 * 
	 * @param model
	 */
	private void setMoney(ConsumeModel model) {
		// 页面总数据
		Long sum;
		// 用户总金额
		Long money;
		// 总页数
		Integer pageInt;
		StatisticsModel statisticsModel = getStatitics(model);
		if (statisticsModel != null & statisticsModel.getCountOrder() != 0) {
			sum = statisticsModel.getCountOrder();
			money = getStatitics(model).getSumMoney();
		} else {
			sum = Long.valueOf(0);
			money = Long.valueOf(0);
		}
		if (sum == 0) {
			pageInt = 1;
		} else {
			// 取整
			BigDecimal pageDouble = new BigDecimal(sum).divide(new BigDecimal(count));
			pageInt = (int) Math.ceil(pageDouble.doubleValue());
		}
		// 将值存放到模型中
		model.setPageSum(pageInt);
		// 将值存放到模型中
		model.setSumMoney(money);
		model.setCountOrder(sum);
	}

	/**
	 * 日期时间转换
	 */
	private void dateModify(ConsumeModel model) {
		Pattern pattern = Pattern.compile("T");
		String newStr = pattern.matcher(model.getConsumeTime()).replaceAll(" ");
		model.setConsumeTime(newStr);
	}

	 /**
	  * 根据用户id返回用户对象
	  */
	public UserModel getuser(Long userId){
		if (userId == null)
			return null ;
		try {
			return dao.getUser(userId) ;
		} catch (Exception e) {
			return null ;
		}
	}
	
}
