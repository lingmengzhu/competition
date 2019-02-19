package com.pxxy.service;

import com.pxxy.entity.Manager;

public interface ManagerService {

	Manager login(Manager manager);

	Manager findManagerById(int managerid);

	void updateManager(Manager manager);

}
