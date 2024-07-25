package com.kh.practice.chap01_poly.controller;

import com.kh.practice.chap01_poly.model.vo.AniBook;
import com.kh.practice.chap01_poly.model.vo.Book;
import com.kh.practice.chap01_poly.model.vo.CookBook;
import com.kh.practice.chap01_poly.model.vo.Member;

public class LibraryController {
	// 필드부
	private Member mem = null;			// null로 명시초기화
	private Book[] bList = new Book[5];	// 크기 5 할당
	
	// 초기화블록을 사용한 배열 초기화
	{
		bList[0] = new CookBook("백종원의 집밥", "백종원", "tvN", true);
		bList[1] = new AniBook("한번 더 해요", "미티", "원모어", 19);
		bList[2] = new AniBook("루피의 원피스", "루피", "japan", 12);
		bList[3] = new CookBook("이혜정의 얼마나 맛있게요", "이혜정", "문학", false);
		bList[4] = new CookBook("최현석 날 따라해봐", "최현석", "소금책", true);
	}
	// 생성자부 : 생략
	
	// 메소드부
	// Member 타입으로 선언된 mem 이라는 필드의 setter 메소드의 역할
	public void insertMember(Member mem) {
		// 전달받은 mem 주소 값을 해당 회원 레퍼런스(mem)에 대입
		this.mem = mem;
	}
	// Member 타입으로 선언된 mem이라는 필드의 getter 메소드의 역할
	public Member myInfo() {
		// 회원 레퍼런스(mem) 주소 값 리턴
		return mem;
	}
	
	// Book[] 로 선언된 bList라는 필드의 getter 메소드 역할
	public Book[] selectAll() {
		// 도서 목록 레퍼런스(bList) 주소 값 리턴
		return bList;
	}
	
	public Book[] searchBook(String keyword) {
		// 검색 결과를 담아줄 새로운 Book 객체 배열 생성
		// 검색 결과 도서 목록이 최대 5개일 수 있으니 임의로 크기 5 할당
		Book[] searchList = new Book[5];
		
		// for문을 이용하여 bList 도서 목록들의 도서명과 전달받은 keyword 비교
		// 전달받은 keyword를 포함하고 있으면 → HINT : String 클래스의 contains() 참고
		// 검색결과의 도서목록에 담기 → HINT : count 이용
		int count = 0;
		for(int i=0; i<bList.length; i++) {
			if (bList[i].getTitle().contains(keyword)) {
				searchList[count] = bList[i];	// keyword 포함된 제목인 도서 객체의 주소를 할당
				count++;
			}
		}		
		// 해당 검색결과의 도서목록 주소 값 리턴
		return searchList;
	}
	
	public int rentBook(int index) {
		int result = 0;
		
		// 전달 받은 index의 bList 객체가 만화책을 참조하고 있고
		if(bList[index] instanceof AniBook) {
			// 해당 만화책의 제한 나이와 회원의 나이를 비교하여 회원 나이가 적을 경우
			// result를 1로 초기화 → 나이제한으로 대여 불가
			AniBook b = ((AniBook)bList[index]);
			if (b.getAccessAge() > mem.getAge()) {
				result = 1;
			}
		} else if(bList[index] instanceof CookBook) {
			// 전달 받은 index의 bList 객체가 요리책을 참조하고 있고
			// 해당 요리책의 쿠폰유무가 “유”일 경우
			CookBook b = (CookBook)bList[index];
			if (b.isCoupon()) {
				// 회원의 couponCount 1 증가 처리 후
				//  => 기존에 저장된 couponCount 값에 1을 추가하여 다시 저장
				mem.setCouponCount( mem.getCouponCount() + 1 );
				// result를 2로 초기화 → 성공적으로 대여 완료, 요리학원 쿠폰 발급
				result = 2;
			}
		}
		// result 값 리턴
		return result;
	}
}
