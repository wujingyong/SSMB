package com.wjy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wjy.mybatis.dao.EmployeeMapper;
import com.wjy.mybatis.entity.Employee;
import com.wjy.mybatis.entity.EmployeeExample;
import com.wjy.mybatis.entity.EmployeeExample.Criteria;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<Employee> getEmployeeWithDepartment(){
		return employeeMapper.selectByExampleWithDepartment(null);
	}

	public void addEmployee(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	
	public boolean validateEmpName(String empName){
		EmployeeExample example = new EmployeeExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	public Employee getEmp(Integer id) {
		return employeeMapper.selectByPrimaryKey(id);		
	}
	
	public int updateEmployee(Employee employee){
		return employeeMapper.updateByPrimaryKeySelective(employee);
	}
	
	public void deleteOne(Integer id){
		employeeMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> delete_ids) {
		EmployeeExample example = new EmployeeExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmpIdIn(delete_ids);
		employeeMapper.deleteByExample(example);
	}
	
}
