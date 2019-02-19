package com.pxxy.service;

import java.util.List;

import com.pxxy.entity.PageBean;
import com.pxxy.entity.Userinfo;

public interface UserinfoService{

	PageBean<Userinfo> findAllUserinfo(int currentPage, int pageSize);

	void delUserinfo(Userinfo userinfo);

	Userinfo findUserinfoById(int own_id);

	void updateUserinfo(Userinfo userinfo);

	void addUserinfo(Userinfo userinfo);

	List<Userinfo> findAllUserinfoByTel(int tel);

	List<Userinfo> findUserinfoByTel(int tel);

}
