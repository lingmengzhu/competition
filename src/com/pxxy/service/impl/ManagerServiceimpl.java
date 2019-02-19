package com.pxxy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pxxy.dao.ManagerDao;
import com.pxxy.entity.Manager;
import com.pxxy.service.ManagerService;

@Service(value = "managerService")
@Transactional
public class ManagerServiceimpl implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	@Override
	public Manager login(Manager manager) {
		
		return managerDao.login(manager);
	}

	@Override
	public Manager findManagerById(int managerId) {
		
		return managerDao.findManagerById(managerId);
	}

	@Override
	public void updateManager(Manager manager) {
		
		managerDao.updateManager(manager);

	}

}
