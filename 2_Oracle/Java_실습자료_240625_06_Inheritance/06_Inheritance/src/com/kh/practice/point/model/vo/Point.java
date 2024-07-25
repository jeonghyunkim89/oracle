package com.kh.practice.point.model.vo;

public class Point {
	// 필드부 -----
	private int x;
	private int y;
	
	// 생성자부 -----
	// * 기본 생성자
	public Point() {}
	// * 매개변수가 2개인 (모든 필드를 매개변수로 하는) 생성자
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	// 메소드부
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	
	@Override		// Object 클래스로 부터 오버라이딩 된 메소드를 의미함!
	public String toString() {
		// return "{x변수에담긴값}, {y변수에담긴값}";
		return x + ", " + y;
	}	
	
}









