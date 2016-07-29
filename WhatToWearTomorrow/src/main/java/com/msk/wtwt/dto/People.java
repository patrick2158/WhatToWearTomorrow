package com.msk.wtwt.dto;

public class People {
	private String email;
	private String password;
	private String name;
	private char sex;
	
	public People() {
		super();
	}

	public People(String email, String password, String name, char sex) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "People [email=" + email + ", password=" + password + ", name=" + name + ", sex=" + sex + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

}
