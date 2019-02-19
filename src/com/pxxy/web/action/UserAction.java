package com.pxxy.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.Sign_up;
import com.pxxy.entity.User;
import com.pxxy.service.Sign_upService;
import com.pxxy.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("userAction") 
@Scope("prototype") 
public class UserAction extends ActionSupport implements ModelDriven<User>,ServletRequestAware,ServletResponseAware{

	@Autowired 
	private UserService userService;
	protected HttpServletRequest request;  
    protected HttpServletResponse response;
	private User user = new User();
	private PageBean<User> pb;
	public PageBean<User> getPb() {
		return pb;
	}
	public void setPb(PageBean<User> pb) {
		this.pb = pb;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	@Autowired
	private Sign_upService sign_upService;
	List<Sign_up> list = null;
	public List<Sign_up> getList() {
		return list;
	}
	public void setList(List<Sign_up> list) {
		this.list = list;
	}
	private int currentPage=1; 
	private int pageSize = 9;
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
//	@Action(value = "log", results = { @Result(name = "suc", location = "/index.jsp"),@Result(name = "login", location = "/index.jsp"
//			+ "") })
//	public String log() { 
//		    User existUser = userService.login(user);
//		if (existUser == null) {
//			return "login";	
//		}
//		  HttpServletRequest request = ServletActionContext.getRequest();
//			HttpSession session = request.getSession();
//			session.setAttribute("user", user);
//			session.setAttribute("tel", user.getTel());
//			int tel=user.getTel();
//			try{
//			list = sign_upService.findSignUpByTel(tel);
//			session.setAttribute("student_id", list.get(0).getStudent_id());
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//			return "suc";
//	}
	@Action(value = "log")
	public void log(){
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			String usernameAjax = request.getParameter("Username");
			String passwordAjax = request.getParameter("Password");
			int telAjax=Integer.parseInt(usernameAjax);
			String password = userService.check(telAjax);
			System.out.println(password);
			if (password == null) {
				JSONObject nulljson = new JSONObject();
				nulljson.put("checkResult", null);
				pw.write(nulljson.toString());
			} else if (password != null && password.equals(passwordAjax) == true) {
				HttpSession session = request.getSession();
				session.setAttribute("tel", telAjax);
				int tel=telAjax;
//				try{
//				list = sign_upService.findSignUpByTel(tel);
//				session.setAttribute("student_id", list.get(0).getStudent_id());
//				}catch(Exception e){
//					e.printStackTrace();
//				}
				JSONObject truejson = new JSONObject();
				truejson.put("checkResult", true);
				pw.write(truejson.toString());
			} else if (password != null && password.equals(passwordAjax) == false) {
				JSONObject falsejson = new JSONObject();
				falsejson.put("checkResult", false);
				pw.write(falsejson.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	@Action(value = "reg")
	public void reg() {
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String yy = request.getParameter("Tel");
			String mm = request.getParameter("Password");
			int tel=Integer.parseInt(yy);
			user.setTel(tel);
			user.setPassword(mm);
			User existUser = userService.login(user);
			if (existUser != null) {
				JSONObject nulljson = new JSONObject();
				nulljson.put("checkResult", false);
				out.write(nulljson.toString());
			}else{
				 userService.register(user);
				JSONObject nulljson = new JSONObject();
				nulljson.put("checkResult", true);
				out.write(nulljson.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Action(value = "/admin/findAllUser",results={ @Result(name="success", location="/admin/user_query.jsp")})
	public String findAllUser() {
		pb=userService.findAllUser(currentPage,pageSize);
		this.setPb(pb);	
		return "success";
	}

	@Action(value = "editUser", results = { @Result(name = "success", location = "/success.jsp") })
	public String editUser() {
		try {
			user = userService.findUserByTel(user.getTel());
			this.setUser(user);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");// 告知浏览器使用什么编码解析文本

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";

	}

	@Action(value = "updateUser", results = { @Result(name = "success", location = "/success.jsp") })

	public String updateUser() {
		try {
			userService.update(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";

	}

	@Action(value = "logout", results = { @Result(name = "success", location = "/index.jsp") })
	public String logout() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if (session.getAttribute("tel") != null) {
			session.removeAttribute("student_department");
			session.removeAttribute("tel");
			session.removeAttribute("student_name");
			session.removeAttribute("student_tel");
			session.removeAttribute("student_sex");
			session.removeAttribute("student_id");
			session.removeAttribute("student_project");
			session.removeAttribute("student_prize");
		}
		

		HttpServletResponse response = (HttpServletResponse) ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");// 告知浏览器使用什么编码解析文本

		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	
		return "success";
	}

	@Action(value = "/admin/delUser", results = { @Result(name = "success",location="/admin/findAllUser",type = "redirect") })
	public String delUser() {
		try {
			userService.delUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	public User getModel() {

		return user;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

}
