package com.pxxy.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pxxy.dao.ManagerDao;
import com.pxxy.entity.Manager;

@Repository(value = "managerDao")

public class ManagerDaoimpl implements ManagerDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@SuppressWarnings("unchecked")
	@Override
	public Manager login(Manager manager) {
		List<Manager> list = (List<Manager>) hibernateTemplate.find(
				"from Manager where managername=? and managerpassword=?", manager.getManagername(),
				manager.getManagerpassword());
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public Manager findManagerById(int managerid) {
		return hibernateTemplate.get(Manager.class, managerid);
	}

	@Override
	public void updateManager(Manager manager) {
		hibernateTemplate.update(manager);

	}

}
