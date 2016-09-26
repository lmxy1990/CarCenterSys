package com.pan.car.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.pan.car.model.ConsumeModel;
import com.pan.car.model.RepairModel;
import com.pan.car.model.StatisticsModel;
import com.pan.car.model.UserModel;

@Repository
public interface ConsumeDao {
	public void addConsume(ConsumeModel consumeModel) throws Exception;

	public void modifyConsume(ConsumeModel consumeModel) throws Exception;

	public void delConsume(Long _parameter) throws Exception;

	public List<ConsumeModel> selectConsumeByUser(ConsumeModel consumeModel) throws Exception;

	public List<ConsumeModel> selectConsumeByClass(ConsumeModel consumeModel) throws Exception;

	public StatisticsModel getStatistics(ConsumeModel consumeModel) throws Exception;

	public Long getReserveCount(Integer _parameter) throws Exception;

	public UserModel getUser(Long _parameter) throws Exception;

	public List<RepairModel> selectState(Integer stateId) throws Exception;
}
