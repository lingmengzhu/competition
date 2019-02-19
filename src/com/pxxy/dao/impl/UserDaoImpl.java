package com.pxxy.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pxxy.dao.UserDao;
import com.pxxy.entity.User;

@Repository(value = "userDao") // UserDaoImpl userdao=new UserDaoImpl()
public class UserDaoImpl implements UserDao {

	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	 List<User> list;

	@Override
	public void addUser(User user) {
		
		hibernateTemplate.save(user);

	}

	@Override
	public User login(User user) {
		List<User> list = (List<User>) hibernateTemplate.find("from User where tel=? and password=?", user.getTel(),
				user.getPassword());
		return list.isEmpty() ? null : list.get(0);
	}

	@Override
	public void delUser(User user) {
		hibernateTemplate.delete(user);

	}

	@Override
	public void update(User user) {
		hibernateTemplate.update(user);

	}

	@Override
	public User findUserByTel(int tel) {
		
		return hibernateTemplate.get(User.class, tel);

	}

	@Override
	public List<User> findAllUser(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		return (List<User>) hibernateTemplate.findByCriteria(criteria , (currentPage-1)*pageSize, pageSize);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		String sql = "select count(*) from User where 1=1";
		List list1 = new ArrayList<>();
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());		
		return list.get(0).intValue();
	}

	@Override
	public String check(int telAjax) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("tel",telAjax));
		list=(List<User>)hibernateTemplate.findByCriteria(criteria);
		return list.isEmpty() ? null : list.get(0).getPassword();
	}
}


