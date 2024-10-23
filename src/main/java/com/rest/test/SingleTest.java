package com.rest.test;

class Single{
	private Single() {
		
	}
	
	private static Single single = null;
	
	public static Single newInstance() {
		if(single==null) {
			single = new Single();
		}
		return single;
	}
}
public class SingleTest {

	
	public static void main(String[] args) {
		Single s1 = Single.newInstance();
		Single s2 = Single.newInstance();
		System.out.println(s1 == s2);//false
	}
}
