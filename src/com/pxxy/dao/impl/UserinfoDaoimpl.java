package com.pxxy.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pxxy.dao.UserinfoDao;
import com.pxxy.entity.Sign_up;
import com.pxxy.entity.User;
import com.pxxy.entity.Userinfo;
@Repository(value = "userinfoDao")
public class UserinfoDaoimpl implements UserinfoDao{
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public void delUserinfo(Userinfo userinfo) {
		
		hibernateTemplate.delete(userinfo);
	}

	@Override
	public Userinfo findUserinfoById(int own_id) {
		
		return hibernateTemplate.get(Userinfo.class, own_id);
	}

	@Override
	public void updateUserinfo(Userinfo userinfo) {
		
		hibernateTemplate.update(userinfo);
	}

	@Override
	public void addUserinfo(Userinfo userinfo) {
		
		hibernateTemplate.save(userinfo);
	}

	@Override
	public List<Userinfo> findAllUserinfoByTel(int tel) {
		
		return (List<Userinfo>) hibernateTemplate.get(Userinfo.class, tel);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
				String sql = "select count(*) from Userinfo where 1=1";
				List list1 = new ArrayList<>();
				List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());		
				return list.get(0).intValue();
			
	}
	@Override
	public List<Userinfo> findAllUserinfo(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Userinfo.class);
		return (List<Userinfo>) hibernateTemplate.findByCriteria(criteria , (currentPage-1)*pageSize, pageSize);
	}

	@Override
	public List<Userinfo> findUserinfoByTel(int tel) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Userinfo.class);
		criteria.add(Restrictions.eq("user.tel", tel));
		return (List<Userinfo>) hibernateTemplate.findByCriteria(criteria);
	}

}
