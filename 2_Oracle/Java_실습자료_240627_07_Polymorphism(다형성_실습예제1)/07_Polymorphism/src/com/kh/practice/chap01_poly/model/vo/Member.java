package com.kh.practice.chap01_poly.model.vo;

public class Member {
	// 필드부
	private String name;			// 회원명
	private int age;				// 회원나이
	private char gender;			// 성별
	private int couponCount = 0;	// 요리학원쿠폰개수 = 0
	
	// 생성자부
	public Member() {
		super();
	}
	public Member(String name, int age, char gender) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	
	// 메소드부
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public int getCouponCount() {
		return couponCount;
	}
	public void setCouponCount(int couponCount) {
		this.couponCount = couponCount;
	}
	
	@Override
	public String toString() {
		return "Member [name=" + name + ", age=" + age + ", gender=" + gender + ", couponCount=" + couponCount + "]";
	}	
}
