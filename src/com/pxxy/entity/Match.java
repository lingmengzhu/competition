package com.pxxy.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "match_tab")
public class Match {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int match_id;
	private String match_time;
	private String match_name;
	private String match_info;
	private String lastsubmit_time;
	private Date match_publishtime;
	private String match_picture;
	public int getMatch_id() {
		return match_id;
	}

	public void setMatch_id(int match_id) {
		this.match_id = match_id;
	}

	public String getMatch_time() {
		return match_time;
	}

	public void setMatch_time(String match_time) {
		this.match_time = match_time;
	}

	public String getMatch_name() {
		return match_name;
	}

	public void setMatch_name(String match_name) {
		this.match_name = match_name;
	}

	public String getMatch_info() {
		return match_info;
	}

	public void setMatch_info(String match_info) {
		this.match_info = match_info;
	}

	public Date getMatch_publishtime() {
		return match_publishtime;
	}

	public void setMatch_publishtime(Date d) {
		this.match_publishtime = d;
	}

	public String getMatch_picture() {
		return match_picture;
	}

	public void setMatch_picture(String match_picture) {
		this.match_picture = match_picture;
	}

	public String getLastsubmit_time() {
		return lastsubmit_time;
	}

	public void setLastsubmit_time(String lastsubmit_time) {
		this.lastsubmit_time = lastsubmit_time;
	}

	@Override
	public String toString() {
		return "Match [match_id=" + match_id + ", match_time=" + match_time + ", match_name=" + match_name
				+ ", match_info=" + match_info + ", lastsubmit_time=" + lastsubmit_time + ", match_publishtime="
				+ match_publishtime + ", match_picture=" + match_picture + "]";
	}
	
}