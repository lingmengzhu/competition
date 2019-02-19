package com.pxxy.web.action;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.pxxy.entity.Products;
import com.pxxy.entity.Sign_up;
import com.pxxy.service.ProductsService;
import com.pxxy.service.Sign_upService;

import net.sf.json.JSONArray;

@ParentPackage("struts-default")
@Namespace("/")
@Controller("productsAction")
@Scope("prototype")
public class ProductsAction extends ActionSupport implements ModelDriven<Products> {
	
	@Autowired 
	private ProductsService productsService;
	private Products products = new Products();
	private List<Products> list = null;
	private PageBean<Products> pb; 
	private int currentPage=1; 
	private int pageSize = 8;
	private String yy;
	private String keywords;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public Products getProducts() {
		return products;
	}
	public void setProducts(Products products) {
		this.products = products;
	}
	public List<Products> getList() {
		return list;
	}
	public void setList(List<Products> list) {
		this.list = list;
	}
	public PageBean<Products> getPb() {
		return pb;
	}
	public void setPb(PageBean<Products> pb) {
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
	@Autowired
	private Sign_upService sign_upService;
	List<Sign_up> Slist = null;
	public List<Sign_up> getSlist() {
		return Slist;
	}
	public void setSlist(List<Sign_up> slist) {
		Slist = slist;
	}
	private List<Products> videoproducts = null;
	private List<Products> developproducts = null;
	private List<Products> pictureproducts = null;
	public List<Products> getVideoproducts() {
		return videoproducts;
	}
	public List<Products> getDevelopproducts() {
		return developproducts;
	}
	public List<Products> getPictureproducts() {
		return pictureproducts;
	}
	@Action(value = "findFourProducts", results = { @Result(name = "success", location = "/index.jsp") })
	public String findFourProducts() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			list = productsService.findFourProducts();
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "findAllTypeProductsForShow", results = { @Result(name = "success", location = "/works.jsp") })
	public String findAllProductsForShow() {
		HttpServletRequest request = ServletActionContext.getRequest();
		videoproducts=productsService.findVideoproducts();
		request.setAttribute("videoproducts", videoproducts);
		developproducts=productsService.findDevelopproducts();
		request.setAttribute("developproducts", developproducts);
		pictureproducts=productsService.findPictureproducts();
		request.setAttribute("pictureproducts", pictureproducts);
		return "success";
	}
	@Action(value = "/admin/findAllProducts", results = { @Result(name = "success", location = "/admin/works/query.jsp") })
	public String findAllProducts(){
		pb=productsService.findAllProducts(currentPage,pageSize);
		this.setPb(pb);	
		return "success";
	}
	@Action(value="findProductsBykey")
	public void findProductsBykey(){
		try{
			list = productsService.findProductsBykey(keywords);
			HttpServletResponse response = ServletActionContext.getResponse(); // 响应对象
			response.setContentType("text/html;charset=UTF-8"); // 告知浏览器使用UTF-8编码
			PrintWriter out = response.getWriter();
			String json = JSONArray.fromObject(list).toString();
			System.out.println(json);
			out.write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}					
	@Action(value = "findUserProductsForShow", results = { @Result(name = "success", location = "/myinfo.jsp") })
	public String findThreeProductsForDrop() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String yy=request.getSession().getAttribute("tel").toString();
			int tel=Integer.parseInt(yy);
			list = productsService.findUserProductsForShow(tel);
			request.setAttribute("products1", list);
			Slist=sign_upService.findSignUpByTel(tel);
			session.setAttribute("student_department", Slist.get(0).getStudent_department());
			session.setAttribute("student_name", Slist.get(0).getStudent_name());
			session.setAttribute("student_tel", Slist.get(0).getStudent_tel());
			session.setAttribute("student_sex", Slist.get(0).getStudent_sex());
			session.setAttribute("student_id", Slist.get(0).getStudent_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "/admin/delProducts")
	public void delProducts(){
		try {
			productsService.delProducts(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	@Action(value = "/admin/editProducts", results = { @Result(name = "success", location = "/admin/works/edit.jsp") })
	public String editProducts() {
		try {
			products = productsService.findProductsById(products.getProducts_id());
			this.setProducts(products);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");// 鍛婄煡娴忚鍣ㄤ娇鐢ㄤ粈涔堢紪鐮佽В鏋愭枃鏈�
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "QeditProducts", results = { @Result(name = "success", location = "/list.jsp") })
	public String QeditProducts() {
		try {
			products = productsService.findProductsById(products.getProducts_id());
			this.setProducts(products);
			// ActionContext.getContext().getValueStack().push(category);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");// 鍛婄煡娴忚鍣ㄤ娇鐢ㄤ粈涔堢紪鐮佽В鏋愭枃鏈�
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	@Action(value = "/admin/updateProducts")
	public void updateProducts() {
		try {
			productsService.updateProducts(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*@Action(value = "QupdateProducts")
	public void QupdateProducts() {
		try {
			productsService.updateProducts(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	@Action(value = "/admin/addProducts")
	public void addProducts() {
		try {
			productsService.addProducts(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Action(value = "QaddProducts", results = { @Result(name = "success", location = "/findUserProductsForShow",type = "redirect") })
	public void QaddProducts() {
		try {
			productsService.addProducts(products);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*@Action(value = "findAllProductsByMatch_id", results = { @Result(name = "success", location = "/success.jsp") })
	public String findAllProductsByMatch_id() {
		try {
			list = productsService.findAllProductsByMatch_id(products.getMatch().getMatch_id());
			this.setList(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}*/
	@Override
	public Products getModel() {
		
		return products;
	}
	
	
}
