package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.HelpCService;
import service.HelpCServiceImp;

//http://localhost:8090/myfinal/helpMain.do

@Controller
public class HelpCController {
	private HelpCService service;
	
	public HelpCController() {
	}
	
	public void setService(HelpCService service) {
		this.service = service;
	}
	
	@RequestMapping("/helpMain.do")
	public ModelAndView helpMain() {
		ModelAndView mav = new ModelAndView();
		if(service.hListProcess() != null)
			mav.addObject("HList", service.hListProcess());
		mav.setViewName("Son_cus/helpC");
		return mav;
	}
}
