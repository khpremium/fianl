package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.MainDto;
import service.MainService;

//http://localhost:8090/myfinal/main.do

@Controller
public class MainController {
	private MainService service;
	
	public MainController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(MainService service) {
		this.service = service;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView listMethod(MainDto md,HttpServletRequest req){
		/*Random ran = new Random();
		int num;
		num=ran.nextInt(10)+1;*/
		ModelAndView mav= new ModelAndView();
		mav.addObject("aList",service.ListProcess());
		mav.addObject("rList",service.rListProcess("222"));
		mav.setViewName("view/main");
		return mav;
	}// list
	
}// class
