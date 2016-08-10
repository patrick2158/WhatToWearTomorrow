package com.msk.wtwt.dto;

public class Outfits {
	private int outfit_num;
	private char outfit_share;
	private String img_path;
	private String caption;
	private String email;

	public Outfits() {
		super();
	}

	public Outfits(int outfit_num, char outfit_share, String img_path, String caption, String email) {
		super();
		this.outfit_num = outfit_num;
		this.outfit_share = outfit_share;
		this.img_path = img_path;
		this.caption = caption;
		this.email = email;
	}

	public int getOutfit_num() {
		return outfit_num;
	}

	public void setOutfit_num(int outfit_num) {
		this.outfit_num = outfit_num;
	}

	public char getOutfit_share() {
		return outfit_share;
	}

	public void setOutfit_share(char outfit_share) {
		this.outfit_share = outfit_share;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Outfits [outfit_num=" + outfit_num + ", outfit_share=" + outfit_share + ", img_path=" + img_path
				+ ", caption=" + caption + ", email=" + email + "]";
	}
}
