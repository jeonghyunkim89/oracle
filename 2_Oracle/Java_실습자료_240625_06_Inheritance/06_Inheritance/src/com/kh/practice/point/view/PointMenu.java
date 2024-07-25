package com.kh.practice.point.view;

import java.util.Scanner;
import com.kh.practice.point.controller.*;

public class PointMenu {
	private Scanner sc = new Scanner(System.in);
	private CircleController cc = new CircleController();
	private RectangleController rc = new RectangleController();
	
	// 기본생성자는 자동으로 생성될 것!
	
	public void mainMenu() {
		/*
		  ===== 메뉴 ===== 
		  1. 원  ➔ circleMenu() 
		  2. 사각형 ➔ rectangleMenu() 
		  9. 끝내기 
		  메뉴 번호 :  
		 */
		while(true) {
			System.out.println("===== 메뉴 =====");
			System.out.println("1. 원");
			System.out.println("2. 사각형");
			System.out.println("9. 끝내기");
			System.out.print("메뉴 번호 : ");
			
			int menu = sc.nextInt();
			
			switch(menu) {
			case 1:
				circleMenu();
				break;
			case 2:
				rectangleMenu();
				break;
			case 9:
				System.out.println("종료합니다.");
				return;
			default:
				System.out.println("다시 입력해주세요.");
			}
		}
	}
	public void circleMenu() {
		/*
			 ===== 원 메뉴 ===== 
			 1. 원 둘레 ➔ calcCircum() 
			 2. 원 넓이 ➔ calcCircleArea() 
			 9. 메인으로 
			 메뉴 번호 :  
		 */
		System.out.println("===== 원 메뉴 =====");
		System.out.println("1. 원 둘레");
		System.out.println("2. 원 넓이");
		System.out.println("9. 메인으로");
		System.out.print("메뉴 번호 : ");
		
		int menu = sc.nextInt();
		
		if (menu != 1 && menu != 2) {
			System.out.println("메인으로 돌아갑니다.");
			return;
		}
		
		if(menu == 1) {
			// 1. 원 둘레 -> calcCircum() 호출
			calcCircum();
		} else if (menu == 2) {
			// 2. 원 넓이 -> calcCircleArea() 호출
			calcCircleArea();
		} 
		
	}
	public void rectangleMenu() {
		/*
		  ===== 메뉴 ===== 
		  1. 사각형 둘레  ➔ calcPerimeter() 
		  2. 사각형 넓이  ➔ calcRectArea() 
		  3. 메인으로 
		  메뉴 번호 :		
		 */
		System.out.println("===== 메뉴 =====");
		System.out.println("1. 사각형 둘레");
		System.out.println("2. 사각형 넓이");
		System.out.println("9. 메인으로");
		System.out.print("메뉴 번호 : ");
		
		int menu = sc.nextInt();
		
		switch(menu) {
		case 1:
			calcPerimeter();
			break;
		case 2:
			calcRectArea();
			break;
		case 9:
			System.out.println("메인으로 돌아갑니다.");
			return;
		default:
			System.out.println("잘못입력했습니다. 메인으로 돌아갑니다.");
			return;
		}
	}
	public void calcCircum() {
		/*
		x 좌표 : 
		y 좌표 : 
		반지름 : 
		// 데이터를 CircleController(cc)의 calcCircum()의 매개변수로 보내 반환 값 출력		
		 */
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		
		System.out.print("반지름 : ");
		int r = sc.nextInt();
		
		System.out.println(cc.calcCircum(x, y, r));
	}
	public void calcCircleArea() {
		/*
		x 좌표 : 
		y 좌표 : 
		반지름 : 
		// 데이터를 CircleController(cc)의 calcArea()의 매개변수로 보내 반환 값 출력
		 */
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		
		System.out.print("반지름 : ");
		int r = sc.nextInt();
		
		System.out.println(cc.calcArea(x, y, r));
	}
	public void calcPerimeter() {
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		
		System.out.print("높이 : ");
		int h = sc.nextInt();
		
		System.out.print("너비 : ");
		int w = sc.nextInt();
		
		System.out.println(rc.calcPerimeter(x, y, h, w));
	}
	public void calcRectArea() {
		System.out.print("x 좌표 : ");
		int x = sc.nextInt();
		
		System.out.print("y 좌표 : ");
		int y = sc.nextInt();
		
		System.out.print("높이 : ");
		int h = sc.nextInt();
		
		System.out.print("너비 : ");
		int w = sc.nextInt();
		
		System.out.println(rc.calcArea(x, y, h, w));
	}
}









