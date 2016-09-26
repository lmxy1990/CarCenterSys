package com.pan.car.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.pan.car.model.UserModel;

@Repository
public interface UserDao {
	public void addUser(UserModel userModel) throws Exception;

	public void modifyUser(UserModel userModel) throws Exception;

	public void delUser(Long id) throws Exception;

	public UserModel selectUser(String name) throws Exception;

	public List<UserModel> listUser(UserModel userModel) throws Exception;

	public List<UserModel> selectUserByFind(UserModel userModel) throws Exception;

	public Integer getUserSum() throws Exception;

	public Integer selectMileage(Long userId) throws Exception;

}
