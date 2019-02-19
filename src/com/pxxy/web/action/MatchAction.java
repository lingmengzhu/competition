package com.pxxy.web.action;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.stereotype.Controller;
import com.pxxy.entity.Match;
import com.pxxy.entity.PageBean;
import com.pxxy.service.MatchService;
import com.pxxy.service.ProductsService;

import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("matchAction")
@Scope("prototype")
public class MatchAction extends ActionSupport implements ModelDriven<Match> {
	@Autowired
	private MatchService matchService;
	private Match match = new Match();
	private PageBean<Match> pb;  
	private int currentPage=1; 
	private int pageSize = 9;
	private List<Match> list = null;
	
	public void setList(List<Match> list) {
		this.list = list;
	}
	public List<Match> getList() {
		return list;
	}
	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public PageBean<Match> getPb() {
		return pb;
	}

	public void setPb(PageBean<Match> pb) {
		this.pb = pb;
	}

	@Action(value = "/admin/findAllMatch", results = { @Result(name = "success", location = "/admin/matchs/query.jsp") })
	public String findAllMatch() {
		pb=matchService.findAllMatch(currentPage,pageSize);
		this.setPb(pb);	
		return "success";

	}
	@Action(value = "findFourMatch", results = { @Result(name = "success", location = "/index.jsp") })
	public String findFourMatch(){
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			list = matchService.findFourMatch();
		    request.setAttribute("matchlist1", list);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
		
	}
	@Action(value = "/admin/findAllMatchForDrop")
	public String findAllMatchForDrop() {
		try {
			List<Match> list =matchService.findAllMatchForDrop();
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
	}

	@Action(value = "/admin/delMatch", results = { @Result(name = "success",location="/admin/findAllMatch",type = "redirect") })
	public String delMatch() {
		try {
			matchService.delMatch(match);
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return "success";
	}

	@Action(value = "/admin/editMatch", results = { @Result(name = "success", location = "/admin/matchs/edit.jsp") })
	public String editMatch() {
		try {
			match = matchService.findMatchById(match.getMatch_id());
			this.setMatch(match);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");// 告知浏览器使用什么编码解析文本
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Action(value = "/admin/updateMatch", results = { @Result(name = "success", location="/admin/findAllMatch",type = "redirect") })
	public String updateMatch() {
		try {
			matchService.updateMatch(match);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Action(value = "/admin/addMatch")
	public void addMatch() {
		try {
			Date d = new Date();  
	        match.setMatch_publishtime(d);
			matchService.addMatch(match);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Match getModel() {
		
		return match;
	}

}
