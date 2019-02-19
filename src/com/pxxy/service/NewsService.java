package com.pxxy.service;

import java.util.List;

import com.pxxy.entity.News;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.User;

public interface NewsService {

	PageBean<News> findAllNews(int currentPage, int pageSize);

	void delNews(News news);

	News findNewsById(int news_id);

	void updateNews(News news);

	void addNews(News news);

	List<News> findFourNews();

}
