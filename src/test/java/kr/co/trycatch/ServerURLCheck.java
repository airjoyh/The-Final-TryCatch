package kr.co.trycatch;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //서버환경 얻어오기
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})//서블릿과 루트 컨텍스트 둘 다 잡겠다!!
public class ServerURLCheck {//서버를 start하지 않고 컨트롤러내의 코드를 테스트!!

	@Inject
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void testRequest() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/we/form"));
	}
}
