package com.pxxy.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pxxy.dao.Sign_upDao;
import com.pxxy.entity.Match;
import com.pxxy.entity.Sign_up;
import com.pxxy.entity.User;

@Repository(value = "sign_upDao")
public class Sign_upDaoimpl implements Sign_upDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Override
	public Sign_up findSign_upById(int student_id) {
		
		return hibernateTemplate.get(Sign_up.class, student_id);

	}

	@Override
	public void updateSign_up(Sign_up sign_up) {
		
		hibernateTemplate.update(sign_up);

	}

	@Override
	public void delSign_up(Sign_up sign_up) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(sign_up);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Sign_up> findAllSign_up(int currentPage, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Sign_up.class);
		return (List<Sign_up>) hibernateTemplate.findByCriteria(criteria , (currentPage-1)*pageSize, pageSize);
	}

	@Override
	public int getCount() {
				String sql = "select count(*) from Sign_up where 1=1";
				List list1 = new ArrayList<>();
				List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());		
				return list.get(0).intValue();
			}

	@Override
	public void addSign_up(Sign_up sign_up) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(sign_up);
	}

	@Override
	public List<Sign_up> findSignUpByTel(int tel) {
		
	DetachedCriteria criteria = DetachedCriteria.forClass(Sign_up.class);
	criteria.add(Restrictions.eq("user.tel", tel));
	return (List<Sign_up>) hibernateTemplate.findByCriteria(criteria);
}
}