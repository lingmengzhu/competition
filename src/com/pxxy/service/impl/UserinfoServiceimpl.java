package com.pxxy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pxxy.dao.UserinfoDao;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.User;
import com.pxxy.entity.Userinfo;
import com.pxxy.service.UserinfoService;
@Service(value = "userinfoService") 
@Transactional
public class UserinfoServiceimpl implements UserinfoService {
	@Resource(name = "userinfoDao")
	private UserinfoDao userinfoDao;

	@Override
	public void delUserinfo(Userinfo userinfo) {
		
		userinfoDao.delUserinfo(userinfo);
	}

	@Override
	public Userinfo findUserinfoById(int own_id) {
		
		return userinfoDao.findUserinfoById(own_id);
	}

	@Override
	public void updateUserinfo(Userinfo userinfo) {
		
		userinfoDao.updateUserinfo(userinfo);
	}

	@Override
	public void addUserinfo(Userinfo userinfo) {
		
		userinfoDao.addUserinfo(userinfo);
	}

	@Override
	public List<Userinfo> findAllUserinfoByTel(int tel) {
		
		return userinfoDao.findAllUserinfoByTel(tel);
	}

	@Override
	public PageBean<Userinfo> findAllUserinfo(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		int count = userinfoDao.getCount();
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<Userinfo> list = userinfoDao.findAllUserinfo(currentPage,pageSize);
		PageBean<Userinfo> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	@Override
	public List<Userinfo> findUserinfoByTel(int tel) {
		// TODO Auto-generated method stub
		return userinfoDao.findUserinfoByTel(tel);
	}
}
