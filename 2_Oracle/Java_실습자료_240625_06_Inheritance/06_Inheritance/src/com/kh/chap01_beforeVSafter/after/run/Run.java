package com.kh.chap01_beforeVSafter.after.run;

import com.kh.chap01_beforeVSafter.after.model.vo.Desktop;
import com.kh.chap01_beforeVSafter.after.model.vo.SmartPhone;

public class Run {

	public static void main(String[] args) {

		Desktop d = new Desktop();
		System.out.println(d.information());
		
		Desktop d2 = new Desktop("삼성", "SS-01", 
								"삼성데스크탑", 200, true);
		System.out.println(d2.information());
		
		SmartPhone s1 = new SmartPhone();
		System.out.println(s1.information());
		
		SmartPhone s2 = new SmartPhone("애플", "A-01", 
										"아이폰15Pro", 200, "KT");
		System.out.println(s2.information());
	}

}




