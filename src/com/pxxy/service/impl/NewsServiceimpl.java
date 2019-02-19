package com.pxxy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pxxy.dao.NewsDao;
import com.pxxy.entity.News;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.User;
import com.pxxy.service.NewsService;

@Service(value = "newsService")
@Transactional
public class NewsServiceimpl implements NewsService {
	@Autowired
	private NewsDao newsDao;
	@Override
	public void delNews(News news) {
		
		newsDao.delNews(news);
		
	}

	@Override
	public News findNewsById(int news_id) {
		
		return newsDao.findNewsById(news_id);
	}

	@Override
	public void updateNews(News news) {
		
		newsDao.updateNews(news);
		
	}

	@Override
	public void addNews(News news) {
		
		newsDao.addNews(news);
	}

	@Override
	public List<News> findFourNews() {
		// TODO Auto-generated method stub
		return newsDao.findFourNews();
	}

	@Override
	public PageBean<News> findAllNews(int currentPage, int pageSize) {
		int count = newsDao.getCount();
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<News> list = newsDao.findAllNews(currentPage,pageSize);
		PageBean<News> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
}
