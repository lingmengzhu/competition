package com.pxxy.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "userinfo_tab")
public class Userinfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int own_id;
	private String own_matchs;
	private String own_products;
	private String own_prizes;
	private String own_tel;
	private String own_studentname;
	@ManyToOne
	@JoinColumn(name="tel",referencedColumnName="tel")
	private User user;
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getOwn_matchs() {
		return own_matchs;
	}

	public void setOwn_matchs(String own_matchs) {
		this.own_matchs = own_matchs;
	}

	public String getOwn_products() {
		return own_products;
	}

	public void setOwn_products(String own_products) {
		this.own_products = own_products;
	}

	public String getOwn_prizes() {
		return own_prizes;
	}

	public void setOwn_prizes(String own_prizes) {
		this.own_prizes = own_prizes;
	}

	public int getOwn_id() {
		return own_id;
	}

	public void setOwn_id(int own_id) {
		this.own_id = own_id;
	}

	public String getOwn_tel() {
		return own_tel;
	}

	public void setOwn_tel(String own_tel) {
		this.own_tel = own_tel;
	}

	@Override
	public String toString() {
		return "Userinfo [own_id=" + own_id + ", own_matchs=" + own_matchs + ", own_products=" + own_products
				+ ", own_prizes=" + own_prizes + ", own_tel=" + own_tel + "]";
	}

	public String getOwn_studentname() {
		return own_studentname;
	}

	public void setOwn_studentname(String own_studentname) {
		this.own_studentname = own_studentname;
	}

}
