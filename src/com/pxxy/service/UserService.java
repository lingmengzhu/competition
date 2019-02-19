package com.pxxy.service;

import com.pxxy.entity.PageBean;
import com.pxxy.entity.User;

public interface UserService {

	public void register(User user);

	public User login(User user);

	PageBean<User> findAllUser(int currentPage, int pageSize);

	public void delUser(User user);

	public void update(User user);

	public User findUserByTel(int tel);

	public String check(int telAjax);

}
