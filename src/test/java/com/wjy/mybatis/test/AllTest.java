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
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.wjy.mybatis.entity.Employee;

//1.导入spring test 2.指定spring配置文件位置和spring webioc的文件
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //拿到webioc容器
@ContextConfiguration(locations={"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/springDispatcherServlet-servlet.xml"})

public class AllTest{
	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc(){
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() throws Exception{
//		MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
//		params.put("pn", Arrays.asList("1"));
//		MvcResult andReturn = mockMvc.perform(MockMvcRequestBuilders.get("/getAll").params(params)).andReturn();
//		MockHttpServletRequest request = andReturn.getRequest();
		MvcResult andReturn = mockMvc.perform(MockMvcRequestBuilders.get("/getAll").param("pn", "2")).andReturn();
		MockHttpServletRequest request = andReturn.getRequest();
		PageInfo<Employee> pageInfo = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("总数==>" + pageInfo.getTotal());
		pageInfo.getList().forEach((e)->System.out.println(e.getEmail()));
	}
	
}

//public class AllTest {
//	@Autowired
//	DepartmentMapper departmentMapper;
//	@Autowired
//	EmployeeMapper employeeMapper;
//	@Autowired
//	SqlSession sqlSession;
//	
//	@Test
//	@Transactional
//	public void selectByExample() throws Exception {
//		departmentMapper.selectByExample(null).forEach((e)->System.out.println(e.getDeptName()));
//		EmployeeExample example = new EmployeeExample();
//		Criteria criteria = example.createCriteria();
//		criteria.andDIdEqualTo(1);
//		employeeMapper.selectByExampleWithDepartment(example).forEach((e)->System.out.println(e.getDepartment().getDeptName()));
//	}
//	
//	@Test
//	@Transactional
//	@Rollback(false)
//	public void insertSelective(){
//		employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
//		Employee employee = new Employee();
//		for(int i=0;i<1000;i++){
//			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
//			employee.setEmpName(uid+i);
//			employee.setEmail(uid+"@qq.com");
//			employee.setGender("F");
//			employee.setdId(1);
//			employeeMapper.insertSelective(employee);
//		}
//	}
//	
//	@Test
//	public void testPageHelper(){
//		PageHelper.startPage(1, 10);
//		employeeMapper.selectByExampleWithDepartment(null).forEach((e)->System.out.println(e.getEmail()));
//	}
//	
//}
*/