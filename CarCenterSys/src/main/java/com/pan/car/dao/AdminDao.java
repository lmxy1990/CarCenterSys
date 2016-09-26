package com.pan.car.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.pan.car.model.AdminModel;

@Repository
public interface AdminDao {
	public void addAdmin(AdminModel adminModel) throws Exception;

	public void modifyAdmin(AdminModel adminModel) throws Exception;

	public void delAdmin(Integer id) throws Exception;

	public AdminModel selectAdmin(String name) throws Exception;

	public List<AdminModel> listAdmin() throws Exception;
}
