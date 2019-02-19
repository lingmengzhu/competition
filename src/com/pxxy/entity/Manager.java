package com.pxxy.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "manager_tab")
public class Manager {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int managerid;
	private String managername;
	private String managerpassword;

	public String getManagername() {
		return managername;
	}

	public void setManagername(String managername) {
		this.managername = managername;
	}

	public String getManagerpassword() {
		return managerpassword;
	}

	public void setManagerpassword(String managerpassword) {
		this.managerpassword = managerpassword;
	}

	public int getManagerid() {
		return managerid;
	}

	public void setManagerid(int managerid) {
		this.managerid = managerid;
	}

	@Override
	public String toString() {
		return "Manager [managerid=" + managerid + ", managername=" + managername + ", managerpassword="
				+ managerpassword + "]";
	}

	
	
	

	

	

	

}
