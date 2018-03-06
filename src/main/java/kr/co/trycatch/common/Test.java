package kr.co.trycatch.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


//메소드 두개 분리
//file아웃프린트하여 나온 정답과 비교
//.close잘해주고.
public class Test {
   public static void main(String[] args) throws IOException {
	   
     
	 Process pro = new ProcessBuilder("cmd","/c","javac c:/jaelee/A.java").start();
     BufferedReader br = new BufferedReader(new InputStreamReader(pro.getInputStream()));
     BufferedReader br2 = new BufferedReader(new InputStreamReader(pro.getErrorStream()));
     
     String str;
     while((str=br.readLine())!= null) {
        System.out.println(str);
     }
     System.out.println("============================");
     while((str=br2.readLine())!= null) {
    	 System.out.println(str);
     }
    //////////////////////////////////////////////////////////////////////////////////////
     Process pro2 = new ProcessBuilder("cmd","/c","java -classpath c:/jaelee A").start();
     BufferedReader br3 = new BufferedReader(new InputStreamReader(pro2.getInputStream()));
     BufferedReader br4 = new BufferedReader(new InputStreamReader(pro2.getErrorStream()));
     
     String str2;
     while((str2=br3.readLine())!= null) {    	 
         System.out.println(str2);
      }
     System.out.println("============================");
     while((str2=br4.readLine())!= null) {
    	 System.out.println(str2);
     }
     
     //검색 키워드: ProcessBuilder 또는 ProcessBuilder사용법
     //참조: http://d2.naver.com/helloworld/1113548
     
     
   }//main
}
