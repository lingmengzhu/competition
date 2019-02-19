package com.pxxy.dao;

import java.util.List;

import com.pxxy.entity.News;

public interface NewsDao {

	void addNews(News news);

	void updateNews(News news);

	List<News> findAllNews(int currentPage, int pageSize);

	void delNews(News news);

	News findNewsById(int news_id);

	List<News> findFourNews();

	int getCount();

}
