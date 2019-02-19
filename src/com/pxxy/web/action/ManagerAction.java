package com.pxxy.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.pxxy.entity.Manager;
import com.pxxy.service.ManagerService;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("managerAction")
@Scope("prototype")
public class ManagerAction extends ActionSupport implements ModelDriven<Manager> {
	
	@Autowired
	private ManagerService managerService;
	private Manager manager = new Manager();
	List<Manager> list=null;
    
	public List<Manager> getList() {
		return list;
	}

	public void setList(List<Manager> list) {
		this.list = list;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	@Action(value = "login", results = { @Result(name = "suc", location = "/admin/index.jsp"),
			@Result(name = "login", location = "/login.jsp") })

	public String login() {
		Manager existManager = managerService.login(manager);    
		if (existManager == null) {
             System.out.println("sssss");
			return "login";
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("admin", manager.getManagername());
		return "suc";

	}

	@Action(value = "editManager", results = { @Result(name = "success", location = "/success.jsp") })
	public String editManager() {
		try {
			manager = managerService.findManagerById(manager.getManagerid());
			this.setManager(manager);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");// 告知浏览器使用什么编码解析文本

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";

	}

	@Action(value = "updateManager", results = { @Result(name = "success", location = "/success.jsp") })
	public String updateManager() {
		try {
			managerService.updateManager(manager);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Override
	public Manager getModel() {
		return manager;
	}

}
