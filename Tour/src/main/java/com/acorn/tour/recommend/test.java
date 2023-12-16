package com.acorn.tour.recommend;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String test = "127215:2849675:774675:2850213:2733962:578330:130658:2836670:2835334:2845699:2773340:2824947:";
		String[] testArray=test.split(":");
		for(int i=0; i<testArray.length; i++) {
			if((i%2)==0) {
				System.out.println("장소: "+testArray[i]);
			}else {
				
				System.out.println("음식점"+testArray[i]);
			}
		}
		
		

	}

}
