package com.kh.practice.point.model.vo;

public class Circle extends Point {	// extends Point => Point 클래스로부터 상속받는다!
	// 상속을 받으므로써 x, y 변수를 멤버로 가지게 된다.
	// 따라서, Circle 클래스는 총 3개의 변수를 가지게 된다.
	private int radius; 

	public Circle() {}
	
	public Circle(int x, int y, int radius) {
		/* 멤버로 가지고 있으나, private 접근제한이 걸려있어 직접 접근 x
		this.x = x;
		this.y = y;
		*/
		/** setXX 메소드를 사용하거나
		setX(x);
		setY(y);
		**/
		super(x, y);		// Point(부모클래스)의 매개변수가 2개인 생성자 호출(사용)
		this.radius = radius;
	}
	
	public int getRadius() {
		return radius;
	}
	public void setRadius(int radius) {
		this.radius = radius;
	}

	@Override
	public String toString() {
		// "{x변수가저장한값}, {y변수에저장된값}, {radius변수에저장된값}"
		return super.toString() + ", " + radius;
		// return getX() + ", " + getY() + ", " + radius;
	}
	
	
}
