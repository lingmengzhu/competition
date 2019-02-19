package com.pxxy.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
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
import com.pxxy.entity.PageBean;
import com.pxxy.entity.Userinfo;
import com.pxxy.service.UserinfoService;

import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("userinfoAction") 
@Scope("prototype")
public class UserinfoAction extends ActionSupport implements ModelDriven<Userinfo> {

@Autowired 
private UserinfoService userinfoService;
private Userinfo userinfo=new Userinfo();
private List<Userinfo> list = null;
private PageBean<Userinfo> pb;  
private int currentPage=1; 
private int pageSize = 9;
private int tel;
public int getTel() {
	return tel;
}

public void setTel(int tel) {
	this.tel = tel;
}

public PageBean<Userinfo> getPb() {
	return pb;
}

public void setPb(PageBean<Userinfo> pb) {
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

public Userinfo getUserinfo() {
	return userinfo;
}

public void setUserinfo(Userinfo userinfo) {
	this.userinfo = userinfo;
}

public List<Userinfo> getList() {
	return list;
}

public void setList(List<Userinfo> list) {
	this.list = list;
}
@Action(value = "/admin/findAllUserinfo", results = { @Result(name = "success", location = "/admin/winner/query.jsp") })
public String findAllUserinfo() {
	pb=userinfoService.findAllUserinfo(currentPage,pageSize);
	this.setPb(pb);	
	return "success";

}
@Action(value = "findUserinfoByTel")
public String findUserinfoByTel() {
	try {
		List<Userinfo> list = userinfoService.findUserinfoByTel(tel);
		HttpServletResponse response = ServletActionContext.getResponse(); // 鍝嶅簲瀵硅薄
		response.setContentType("text/html;charset=UTF-8"); // 鍛婄煡娴忚鍣ㄤ娇鐢║TF-8缂栫爜
		PrintWriter out = response.getWriter();
		String json = JSONArray.fromObject(list).toString();
		System.out.println(json);
		out.write(json);
	} catch (IOException e) {
		e.printStackTrace();
	}
	return null;

}
@Action(value = "/admin/delUserinfo", results = { @Result(name = "success", location="/admin/findAllUserinfo",type = "redirect") })
public String delUserinfo() {
	try {
		userinfoService.delUserinfo(userinfo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "success";
}


@Action(value = "/admin/editUserinfo", results = { @Result(name = "success", location = "/admin/winner/edit.jsp") })
public String editUserinfo() {
	try {
		userinfo = userinfoService.findUserinfoById(userinfo.getOwn_id());
		this.setUserinfo(userinfo);
		// ActionContext.getContext().getValueStack().push(category);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");// 鍛婄煡娴忚鍣ㄤ娇鐢ㄤ粈涔堢紪鐮佽В鏋愭枃鏈�
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "success";
}

@Action(value = "/admin/updateUserinfo")
public void updateUserinfo() {
	try {
		userinfoService.updateUserinfo(userinfo);
	} catch (Exception e) {
		e.printStackTrace();
	}
}

@Action(value = "/admin/addUserinfo")
public void addUserinfo() {
	try {
		userinfoService.addUserinfo(userinfo);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
/*@Action(value = "findAllUserinfoByTel", results = { @Result(name = "success", location = "/success.jsp") })
public String findAllUserinfoByTel() {
	try {
		list = userinfoService.findAllUserinfoByTel(userinfo.getUser().getTel());
		this.setList(list);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "success";

}*/

	@Override
	public Userinfo getModel() {
		return userinfo;
	}

	
}
