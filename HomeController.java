package com.springtutorials.homecontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController 
{
	@RequestMapping(value = "/Home", method = RequestMethod.GET)
	public ModelAndView Home() 
	{
		return new ModelAndView("Home", "command", null);
	}
}
