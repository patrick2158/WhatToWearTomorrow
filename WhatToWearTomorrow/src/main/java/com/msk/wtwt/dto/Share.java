package com.msk.wtwt.dto;

public class Share {
	private int outfit_num;
	private String name;
	private String caption;
	private char sex;
	private String img_path;
	
	public Share() {
		super();
	}

	public Share(int outfit_num, String name, String caption, char sex, String img_path) {
		super();
		this.outfit_num = outfit_num;
		this.name = name;
		this.caption = caption;
		this.sex = sex;
		this.img_path = img_path;
	}

	public int getOutfit_num() {
		return outfit_num;
	}

	public void setOutfit_num(int outfit_num) {
		this.outfit_num = outfit_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public char getSex() {
		return sex;
	}

	public void setSex(char sex) {
		this.sex = sex;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	@Override
	public String toString() {
		return "Share [outfit_num=" + outfit_num + ", name=" + name + ", caption=" + caption + ", sex=" + sex
				+ ", img_path=" + img_path + "]";
	}

}
