package com.pan.car.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.pan.car.model.StateModel;

@Repository
public interface StateDao {
	public void addState(StateModel stateModel) throws Exception;

	public void modifyState(StateModel stateModel) throws Exception;

	public void delState(Integer id) throws Exception;

	public List<StateModel> listState() throws Exception;
}
