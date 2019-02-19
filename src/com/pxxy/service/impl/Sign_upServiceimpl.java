package com.pxxy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pxxy.dao.Sign_upDao;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.Sign_up;
import com.pxxy.service.Sign_upService;

@Service(value = "sign_upService")
@Transactional
public class Sign_upServiceimpl implements Sign_upService {
	@Autowired
	private Sign_upDao sign_upDao;

	@Override
	public Sign_up findSign_upById(int student_id) {
		
		return sign_upDao.findSign_upById(student_id);
	}

	@Override
	public void updateSign_up(Sign_up sign_up) {
		
		sign_upDao.updateSign_up(sign_up);

	}

	@Override
	public void delSign_up(Sign_up sign_up) {
		
		sign_upDao.delSign_up(sign_up);

		
	}

	@Override
	public PageBean<Sign_up> findAllSign_up(int currentPage, int pageSize) {
		int count = sign_upDao.getCount();
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<Sign_up> list = sign_upDao.findAllSign_up(currentPage,pageSize);
		PageBean<Sign_up> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	@Override
	public void addSign_up(Sign_up sign_up) {
		// TODO Auto-generated method stub
		sign_upDao.addSign_up(sign_up);
	}

	@Override
	public List<Sign_up> findSignUpByTel(int tel) {
		// TODO Auto-generated method stub
		return sign_upDao.findSignUpByTel(tel);
	}

}
