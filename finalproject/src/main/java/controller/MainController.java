package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.MainService;

//http://localhost:8090/myfinal/main.do

@Controller
public class MainController {
	private MainService service;
	
	public MainController() {
	}
	
	public void setService(MainService service) {
		this.service = service;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView listMethod(){
		ModelAndView mav= new ModelAndView();
		mav.addObject("aList",service.ListProcess());
		mav.setViewName("view/NewMain");
		return mav;
	}// list
	
}// class
