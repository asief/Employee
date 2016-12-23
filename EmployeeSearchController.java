package com.springtutorials.employeesearchcontroller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.springtutorials.employeesearchbean.EmployeeSearchBean;

@Controller
public class EmployeeSearchController 
{
	@RequestMapping(value = "/EmployeeSearch", method = RequestMethod.GET)
	public ModelAndView Employee() 
	{
		return new ModelAndView("EmployeeSearch", "command", new EmployeeSearchBean());
	}

	@RequestMapping(value="/EmployeeSearch", method=RequestMethod.POST)
    public @ResponseBody String addUser(@ModelAttribute(value="employee") EmployeeSearchBean employee, ModelMap model )
	{
		EmployeeSearchBean e1 = new EmployeeSearchBean();
		e1.setAge(15);
		e1.setId(7);
		e1.setName("Apple");
		
		EmployeeSearchBean e2 = new EmployeeSearchBean();
		e2.setAge(15);
		e2.setId(8);
		e2.setName("Banana");
		
		EmployeeSearchBean e3 = new EmployeeSearchBean();
		e3.setAge(17);
		e3.setId(9);
		e3.setName("Orange");
		
		List<EmployeeSearchBean> employeeList = new ArrayList<EmployeeSearchBean>();
		employeeList.add(e1);
		employeeList.add(e2);
		employeeList.add(e3);
		
		Gson gs = new Gson();
		String jsonList = gs.toJson(employeeList);
		
        return jsonList;
    }
}
