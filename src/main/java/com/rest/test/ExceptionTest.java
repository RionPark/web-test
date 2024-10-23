package com.rest.test;

public class ExceptionTest {

	public static void main(String[] args) {
		System.out.println("시스템이 시작되었습니다.");
		try {
			String str = "원투쓰리";
			int num = Integer.parseInt(str);
			System.out.println(num);
		}catch(Exception e) {
			System.err.println("숫자를 입력하지 않았습니다.");
		}
		
		System.out.println("시스템이 종료되었습니다.");
	}
}
