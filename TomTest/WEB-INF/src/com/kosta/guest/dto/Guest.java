package com.kosta.guest.dto;

import java.sql.Date;

public class Guest {
	
	private int id;
	private String name, pass, email, tel, contents;
	private String gdate;
	
	public Guest() {

	}

	public Guest(int id, String name, String pass, String email, String tel, String contents, String gdate) {
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.email = email;
		this.tel = tel;
		this.contents = contents;
		this.gdate = gdate;
	}
	
	public Guest(int id, String name, String pass, String email, String tel, String contents) {
		this.id = id;
		this.name = name;
		this.pass = pass;
		this.email = email;
		this.tel = tel;
		this.contents = contents;
	}
	
	public Guest(String name, String pass, String email, String tel, String contents) {
		this.name = name;
		this.pass = pass;
		this.email = email;
		this.tel = tel;
		this.contents = contents;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getGdate() {
		return gdate;
	}

	public void setGdate(String gdate) {
		this.gdate = gdate;
	}
	
	

}
