package com.wjy.mybatis.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.wjy.configuration.RootConfig;
@ActiveProfiles(profiles={"dev"})
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={RootConfig.class})
@WebAppConfiguration
public class SpringBootTest {
	@Autowired  
    private WebApplicationContext context;  
      
    private MockMvc mockMvc;   
  
    @Before   
    public void setupMockMvc() throws Exception {   
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();   
    }  
	
	@Autowired
	ComboPooledDataSource dataSource;
	@Test
	public void getAll() throws Exception {
		ResultActions perform = mockMvc.perform(MockMvcRequestBuilders.get("/getAll").param("pn", "8"));
		System.out.println(perform.toString());
		MvcResult andReturn = perform.andReturn();
		MockHttpServletResponse request = andReturn.getResponse();
		String contentAsString = request.getContentAsString();
		System.out.println(contentAsString);
	}

}