package kr.co.trycatch;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class OracleConnectionTest {
	
	@Test //단위테스트 하고자 하는 메소드
	public void testConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//try(자동 자원반환 할 클래스){} ==> finally{자원반환}코드 생략 가능
		try(Connection conn =
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger")){
			
			System.out.println("연결 성공~"+conn);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
