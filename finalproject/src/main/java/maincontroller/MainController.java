package maincontroller;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import maindto.MainDto;
import mainservice.MainService;

//http://localhost:8090/myfinal/main.do

@Controller
public class MainController {
	private MainService service;
	private MainDto md;
	
	public MainController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(MainService service) {
		this.service = service;
	}
	
	@RequestMapping("/main.do")
	public ModelAndView listMethod(MainDto md){
		Random ran = new Random();
		int num;
		num=ran.nextInt(10)+1;		
		ModelAndView mav= new ModelAndView();
		mav.addObject("aList",service.ListProcess());
		mav.addObject("rList",service.rListProcess(2));
		mav.setViewName("main/main");
		return mav;
	}// list
	
	
	
}// class
