package com.pxxy.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pxxy.dao.MatchDao;
import com.pxxy.entity.Match;
import com.pxxy.entity.News;
import com.pxxy.entity.User;

@Repository(value = "matchDao")
public class MatchDaoimpl implements MatchDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	@Override
	public void addMatch(Match match) {
		hibernateTemplate.save(match);
	}

	
	@Override
	public void delMatch(Match match) {
		String sql="delect from Products where Match_id=match_id;delect from Match where Match_id=match_id";
		hibernateTemplate.delete(sql);
	}
	@Override
	public void updateMatch(Match match) {
		hibernateTemplate.update(match);
	}
	@Override
	public Match findMatchById(int match_id) {
		return hibernateTemplate.get(Match.class, match_id);
	}
	@Override
	public List<Match> findAllMatch(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(Match.class);
		return (List<Match>) hibernateTemplate.findByCriteria(criteria , (currentPage-1)*pageSize, pageSize);
	}
	@Override
	public int getCount() {
		String sql = "select count(*) from Match where 1=1";
		List list1 = new ArrayList<>();
		List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());		
		return list.get(0).intValue();
	}


	@Override
	public List<Match> findAllMatchForDrop() {
		// TODO Auto-generated method stub
		return (List<Match>) hibernateTemplate.find("from Match");
	}


	@Override
	public List<Match> findFourMatch() {
			// TODO Auto-generated method stub
			DetachedCriteria criteria = DetachedCriteria.forClass(Match.class);
			criteria.addOrder(Order.desc("match_id"));
			return (List<Match>) hibernateTemplate.findByCriteria(criteria , 0, 4);
		}
	}


