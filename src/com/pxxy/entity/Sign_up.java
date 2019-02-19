package com.pxxy.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "sign_up_tab")
public class Sign_up {
	@Id
	private int student_id;
	private String student_name;
	private String student_department;
	private String student_sex;
	private String student_tel;
	@ManyToOne
	@JoinColumn(name="tel",referencedColumnName="tel")
	private User user;
	public User getUser(){
		return user;
		
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_department() {
		return student_department;
	}

	public void setStudent_department(String student_department) {
		this.student_department = student_department;
	}

	public String getStudent_sex() {
		return student_sex;
	}

	public void setStudent_sex(String student_sex) {
		this.student_sex = student_sex;
	}

	public String getStudent_tel() {
		return student_tel;
	}

	public void setStudent_tel(String student_tel) {
		this.student_tel = student_tel;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	@Override
	public String toString() {
		return "Sign_up [student_id=" + student_id + ", student_name=" + student_name + ", student_department="
				+ student_department + ", student_sex=" + student_sex + ", student_tel=" + student_tel + ", user="
				+ user + "]";
	}

}
