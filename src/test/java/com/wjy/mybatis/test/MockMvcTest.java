/*package com.wjy.mybatis.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.DefaultMockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.wjy.mybatis.entity.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/springDispatcherServlet-servlet.xml"})
@WebAppConfiguration
public class MockMvcTest {
	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc(){
		DefaultMockMvcBuilder defaultMockMvcBuilder = MockMvcBuilders.webAppContextSetup(context);
		mockMvc = defaultMockMvcBuilder.build();
	}
	
	@SuppressWarnings("unchecked")
	@Test
	public void testMockMvc() throws Exception{
		ResultActions perform = mockMvc.perform(MockMvcRequestBuilders.get("/getAll").param("pn", "8"));
		MvcResult andReturn = perform.andReturn();
		MockHttpServletRequest request = andReturn.getRequest();
		PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
		pageInfo.getList().forEach((e)->System.out.println(e.getEmail()));
		int navigatePages = pageInfo.getNavigatePages();
		System.out.println(navigatePages);
		int navigateFirstPage = pageInfo.getNavigateFirstPage();
		int navigateLastPage = pageInfo.getNavigateLastPage();
		int[] navigatepageNums = pageInfo.getNavigatepageNums();
		for(int i=0;i<navigatepageNums.length;i++)
			System.out.println(navigatepageNums[i]);
		System.out.println(navigateFirstPage);
		System.out.println(navigateLastPage);
	}
}
*/