package com.pxxy.dao;

import java.util.List;

import com.pxxy.entity.Sign_up;

public interface Sign_upDao {

	List<Sign_up> findAllSign_up(int currentPage, int pageSize);

	Sign_up findSign_upById(int student_id);

	void updateSign_up(Sign_up sign_up);

	void delSign_up(Sign_up sign_up);

	int getCount();

	void addSign_up(Sign_up sign_up);

	List<Sign_up> findSignUpByTel(int tel);

}
