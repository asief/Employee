package com.springtutorials.employeemodifycontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.springtutorials.employeemodifybean.EmployeeModifyBean;

@Controller
public class EmployeeModifyController 
{
    @RequestMapping(value = "/EmployeeModify", method = RequestMethod.GET)
	public ModelAndView modifyEmployeeInformation()
	{
    	return new ModelAndView("EmployeeModify", "command", new EmployeeModifyBean());
	}
	
    @RequestMapping(value = "/EmployeeModify", method = RequestMethod.POST)
    @ResponseBody
	public String  getEmployeeInformation(@ModelAttribute(value="employeeModify") EmployeeModifyBean employee)
	{
    	
    	EmployeeModifyBean e1 = new EmployeeModifyBean();
    	e1.setEmployeeName(employee.getEmployeeName());
    	e1.setEmployeeId("607552");
    	e1.setLocation("London");
    	e1.setProjectCode("BOMMPPDV");
    	
    	String data = "";
    	
    	Gson gs = new Gson();
    	data = gs.toJson(e1);
		
    	return data;
	}
}
