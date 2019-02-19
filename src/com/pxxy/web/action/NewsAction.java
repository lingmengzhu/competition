package com.pxxy.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pxxy.entity.News;
import com.pxxy.entity.PageBean;
import com.pxxy.service.NewsService;

import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("newsAction")
@Scope("prototype")
public class NewsAction extends ActionSupport implements ModelDriven<News> {
	
	@Autowired
	private NewsService newsService;
	private News news=new News();
	private PageBean<News> pb;  
	private int currentPage=1; 
	private int pageSize = 9;
	public PageBean<News> getPb() {
		return pb;
	}
	public void setPb(PageBean<News> pb) {
		this.pb = pb;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	List<News> list=null;
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public List<News> getList() {
		return list;
	}
	public void setList(List<News> list) {
		this.list = list;
	}
	@Action(value = "findFourNews", results = { @Result(name = "success", location = "/index.jsp") })
	public String findFourNews(){
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			list = newsService.findFourNews();
		    request.setAttribute("news1", list);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
		
	}
	@Action(value = "/admin/findAllNews", results = { @Result(name = "success", location = "/admin/news/query.jsp") })
	public String findAllNews(){
		pb=newsService.findAllNews(currentPage,pageSize);
		this.setPb(pb);	
		return "success";
		
	}
	/*@Action(value = "findAllNewsForShow", results = { @Result(name = "success", location = "/success.jsp") })
	public String findAllNewsForShow() {
		try {
			List<News> list = newsService.findAllNews();
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			System.out.println(json);
			out.write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}*/
	@Action(value = "/admin/delNews", results = { @Result(name = "success", location="/admin/findAllNews",type = "redirect") })
	public String delNews() {
		try {
			newsService.delNews(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "/admin/editNews", results = { @Result(name = "success", location = "/admin/news/edit.jsp") })
	public String editNews() {
		try {
			news = newsService.findNewsById(news.getNews_id());
			this.setNews(news);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");// 告知浏览器使用什么编码解析文本
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "/admin/updateNews")
	public void updateNews(){
		try {
			newsService.updateNews(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action(value = "/admin/addNews")
	public void addNews() {
		try {
			Date d = new Date();  
	        news.setNews_time(d);
			newsService.addNews(news);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public News getModel() {
		
		return news;
	}

}
