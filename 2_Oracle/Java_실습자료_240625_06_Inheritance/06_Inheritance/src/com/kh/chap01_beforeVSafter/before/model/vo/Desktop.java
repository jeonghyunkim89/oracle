package com.kh.chap01_beforeVSafter.before.model.vo;
// *.before.* 경로의 Desktop
public class Desktop {
	// 필드부 
	private String brand;
	private String code;
	private String name;
	private int price;
	private boolean allInOne;
	
	// 생성자부
	public Desktop() {
		
	}
	
	// 메소드부
	public String informtaion() {
		return "brand="+brand
				+", code="+code
				+", name="+name
				+", price="+price
				+", allInOne="+allInOne;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public boolean isAllInOne() {
		return allInOne;
	}

	public void setAllInOne(boolean allInOne) {
		this.allInOne = allInOne;
	}
	
}
