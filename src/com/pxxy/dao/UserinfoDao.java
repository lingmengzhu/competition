package com.pxxy.dao;

import java.util.List;

import com.pxxy.entity.Userinfo;

public interface UserinfoDao {

	void delUserinfo(Userinfo userinfo);

	Userinfo findUserinfoById(int own_id);

	void updateUserinfo(Userinfo userinfo);

	void addUserinfo(Userinfo userinfo);

	List<Userinfo> findAllUserinfoByTel(int tel);

	int getCount();

	List<Userinfo> findAllUserinfo(int currentPage, int pageSize);

	List<Userinfo> findUserinfoByTel(int tel);

}
