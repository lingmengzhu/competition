package com.pxxy.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pxxy.entity.PageBean;
import com.pxxy.dao.UserDao;
import com.pxxy.entity.User;
import com.pxxy.service.UserService;

@Service(value = "userService") // UserServiceImpl userService=new
								// UserServiceImpl();
@Transactional
public class UserServiceImpl implements UserService {
	@Resource(name = "userDao")
	private UserDao userDao;

	@Override
	public void register(User user) {
		System.out.println("注册执行");
		userDao.addUser(user);
	}

	@Override
	public User login(User user) {
		return userDao.login(user);
	}


	@Override
	public void delUser(User user) {
		
		userDao.delUser(user);

	}

	@Override
	public void update(User user) {
		userDao.update(user);

	}

	@Override
	public User findUserByTel(int tel) {
		
		return userDao.findUserByTel(tel);
	}

	@Override
	public PageBean<User> findAllUser(int currentPage, int pageSize) {
		int count = userDao.getCount();
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<User> list = userDao.findAllUser(currentPage,pageSize);
		PageBean<User> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	@Override
	public String check(int telAjax) {
		// TODO Auto-generated method stub
		return userDao.check(telAjax);
	}
}
