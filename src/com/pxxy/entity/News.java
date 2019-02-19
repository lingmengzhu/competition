package com.pxxy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "news_tab")
public class News {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int news_id;
	private Date news_time;
	private String news_title;
	private String news_info;
	private String news_pic;
	

	

	public int getNews_id() {
		return news_id;
	}

	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}


	public Date getNews_time() {
		return news_time;
	}

	public void setNews_time(Date news_time) {
		this.news_time = news_time;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_info() {
		return news_info;
	}

	public void setNews_info(String news_info) {
		this.news_info = news_info;
	}

	public String getNews_pic() {
		return news_pic;
	}

	public void setNews_pic(String news_pic) {
		this.news_pic = news_pic;
	}

	@Override
	public String toString() {
		return "News [news_id=" + news_id + ", news_time=" + news_time + ", news_title=" + news_title + ", news_info="
				+ news_info + ", news_pic=" + news_pic + "]";
	}
	

	

	



}
