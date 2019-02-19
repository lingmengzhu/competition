package com.pxxy.dao;

import java.util.List;

import com.pxxy.entity.User;

public interface UserDao {

	public User login(User user);

	public void delUser(User user);

	public void addUser(User user);

	public void update(User user);

	public User findUserByTel(int tel);

	public List<User> findAllUser(int currentPage, int pageSize);
    
	int getCount();

	public String check(int telAjax);
}
