package com.pxxy.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.pxxy.dao.NewsDao;
import com.pxxy.entity.News;
import com.pxxy.entity.User;
@Repository(value = "newsDao")
public class NewsDaoimpl implements NewsDao {
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	@Override
	public void addNews(News news) {
		
		hibernateTemplate.save(news);
	}

	@Override
	public void updateNews(News news) {
		
		hibernateTemplate.update(news);
		
	}

	@Override
	public void delNews(News news) {
		
		hibernateTemplate.delete(news);
		
	}

	@Override
	public News findNewsById(int news_id) {
		
		return hibernateTemplate.get(News.class,news_id);
	}

	@Override
	public List<News> findFourNews() {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
		criteria.addOrder(Order.desc("news_id"));
		return (List<News>) hibernateTemplate.findByCriteria(criteria , 0, 4);
	}

	@Override
	public List<News> findAllNews(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
		return (List<News>) hibernateTemplate.findByCriteria(criteria , (currentPage-1)*pageSize, pageSize);
	
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
				String sql = "select count(*) from News where 1=1";
				List list1 = new ArrayList<>();
				List<Long> list = (List<Long>) hibernateTemplate.find(sql, list1.toArray());		
				return list.get(0).intValue();
	}

}
