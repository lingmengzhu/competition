package com.pxxy.dao;

import com.pxxy.entity.Manager;

public interface ManagerDao {

	Manager login(Manager manager);

	Manager findManagerById(int managerId);

	void updateManager(Manager manager);

}
