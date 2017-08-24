package com.wjy.handler;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wjy.mybatis.entity.Msg;
import com.wjy.services.DepartmentService;

@Controller
public class DepartmentHandler {
	@Autowired
	DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping(method=RequestMethod.GET, value="getDepts")
	public Msg getDepartmentS(HttpServletRequest request, ModelMap map){
		return Msg.success().add("depts", departmentService.getDepartments());
	}
}
