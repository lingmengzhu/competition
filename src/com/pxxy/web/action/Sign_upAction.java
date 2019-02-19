package com.pxxy.web.action;

import java.util.List;
import javax.annotation.Resource;
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
import com.pxxy.entity.PageBean;
import com.pxxy.entity.Sign_up;
import com.pxxy.service.Sign_upService;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("sign_upAction") 
@Scope("prototype")
public class Sign_upAction extends ActionSupport implements ModelDriven<Sign_up> {
	
	@Autowired 
	private Sign_upService sign_upService;
	private Sign_up sign_up = new Sign_up();
	private List<Sign_up> list = null;
	private PageBean<Sign_up> pb;
	private int currentPage=1; 
	private int pageSize = 9;
	private String yy;
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public PageBean<Sign_up> getPb() {
		return pb;
	}

	public void setPb(PageBean<Sign_up> pb) {
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

	public void setList(List<Sign_up> list) {
		this.list = list;
	}
	public List<Sign_up> getList() {
		return list;
	}

	public Sign_up getSign_up() {
		return sign_up;
	}
	public void setSign_up(Sign_up sign_up) {
		this.sign_up = sign_up;
	}

	@Action(value = "/admin/findAllSign_up", results = { @Result(name = "success", location = "/admin/com_query.jsp") })
	public String findAllSign_up() {
		pb=sign_upService.findAllSign_up(currentPage,pageSize);
		this.setPb(pb);	
		return "success";
	}
    @Action(value="addSign_up", results = { @Result(name = "success", location = "/findUserProductsForShow",type = "redirect") })
    public String addSign_up(){
    	try {
			sign_upService.addSign_up(sign_up);
		} catch (Exception e){
			e.printStackTrace();
		}
		return "success";
    }
	@Action(value = "/admin/editSign_up", results = { @Result(name = "success", location = "/admin/com_edit.jsp") })
	public String editSign_up() {
		try {
			sign_up = sign_upService.findSign_upById(sign_up.getStudent_id());
			this.setSign_up(sign_up);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	@Action(value = "/admin/updateSign_up")
	public void updateSign_up() {
		try {
			sign_upService.updateSign_up(sign_up);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action(value = "updateSign_upX", results = { @Result(name = "success", location = "/findUserProductsForShow",type = "redirect") })
	public String updateSign_upX() {
		try {
			sign_upService.updateSign_up(sign_up);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value="/admin/delSign_up",results={ @Result(name = "success", location="/admin/findAllSign_up",type = "redirect")})
	public String delSign_up() {
		try {
			sign_upService.delSign_up(sign_up);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Override
	public Sign_up getModel() {
		
		return sign_up;
	}

}
