package com.pxxy.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "products_tab")
public class Products {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int products_id;
	private String products_name;
	private String products_author;
	private String pic_path;
	private String products_prize;
	private String products_link;
	private String products_type;
	private String instructor;
	private int products_value;
	@ManyToOne
	@JoinColumn(name="tel",referencedColumnName="tel")
	private User user;
	@ManyToOne
	@JoinColumn(name="match_id",referencedColumnName="match_id")
	private Match match;

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPic_path() {
		return pic_path;
	}

	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public int getProducts_id() {
		return products_id;
	}

	public void setProducts_id(int products_id) {
		this.products_id = products_id;
	}

	public String getProducts_name() {
		return products_name;
	}

	public void setProducts_name(String products_name) {
		this.products_name = products_name;
	}

	public String getProducts_author() {
		return products_author;
	}

	public void setProducts_author(String products_author) {
		this.products_author = products_author;
	}

	public Match getMatch() {
		return match;
	}

	public void setMatch(Match match) {
		this.match = match;
	}

	public int getProducts_value() {
		return products_value;
	}

	public void setProducts_value(int products_value) {
		this.products_value = products_value;
	}

	public String getProducts_prize() {
		return products_prize;
	}

	public void setProducts_prize(String products_prize) {
		this.products_prize = products_prize;
	}

	public String getProducts_link() {
		return products_link;
	}

	public void setProducts_link(String products_link) {
		this.products_link = products_link;
	}

	@Override
	public String toString() {
		return "Products [products_id=" + products_id + ", products_name=" + products_name + ", products_author="
				+ products_author + ", pic_path=" + pic_path + ", products_prize=" + products_prize + ", products_link="
				+ products_link + ", products_value=" + products_value + ", match=" + match + "]";
	}

	public String getProducts_type() {
		return products_type;
	}

	public void setProducts_type(String products_type) {
		this.products_type = products_type;
	}
	

	
	}

	
	

	


