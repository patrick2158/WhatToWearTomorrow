package com.msk.wtwt.dto;

public class Items {
	private int item_num;
	private String name;
	private String brand;
	private String season;
	private String category;
	private double price;
	private String item_size;
	private String email;

	public Items() {
		super();
	}

	public Items(int item_num, String name, String brand, String season, String category, double price,
			String item_size, String email) {
		super();
		this.item_num = item_num;
		this.name = name;
		this.brand = brand;
		this.season = season;
		this.category = category;
		this.price = price;
		this.item_size = item_size;
		this.email = email;
	}

	public int getItem_num() {
		return item_num;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getItem_size() {
		return item_size;
	}

	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Items [item_num=" + item_num + ", name=" + name + ", brand=" + brand
				+ ", season=" + season + ", category=" + category + ", price=" + price + ", item_size=" + item_size
				+ ", email=" + email + "]";
	}

}
