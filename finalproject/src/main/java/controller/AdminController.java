package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.AdminService;

// http://localhost:8090/myfinal/adminMain.do

@Controller
public class AdminController {
	private AdminService service;

	public AdminController() {
	
	}
	
	public void setService(AdminService service) {
		this.service = service;
	}
	
	@RequestMapping("/adminMain.do")
	public ModelAndView clientSelectList() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("aList",service.clientSelectProcess());
		mav.setViewName("/nononono/adminMain");
		return mav;
	}//clientSelectList()
	
	@RequestMapping("/airTables.do")
	public ModelAndView airInfoSelectList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList",service.airInfoSelectProcess());
		mav.setViewName("/nononono/airTables");
		return mav;
	}
	
	@RequestMapping("/resTable.do")
	public ModelAndView reservationInfoSelectList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList",service.reservationSelectProcess());
		mav.setViewName("/nononono/resTable");
		return mav;
	}
	
	@RequestMapping("/clientDelete.do")
	public String clientDeleteMethod(String id) {
		System.out.println(id);
		service.clientDeleteProcess(id);
		return "redirect:/adminMain.do";
	}
	
	@RequestMapping("/airinfoDelete.do")
	public String airinfoDeleteMethod(String flight) {
		System.out.println(flight);
		service.airinfoDeleteProcess(flight);
		return "redirect:/airTables.do";
	}
	
	@RequestMapping("/reservationDelete.do")
	public String reservationDeleteMethod(String rv_num) {
		System.out.println(rv_num);
		service.reservationDeleteProcess(rv_num);
		return "redirect:/resTable.do";
	}
	
	@RequestMapping("/clientChkProcess.do")
	public @ResponseBody int clientProcess(String id) {
		
		return service.clientChkProcess(id);
	}
	
	@RequestMapping("/airinfoChkProcess.do")
	public @ResponseBody int airinfoProcess(String flight) {
		return service.airinfoChkProcess(flight);
	}
	
	@RequestMapping("/clientUpdate.do")
	public ModelAndView clientUpdateSelectList(String id) {
		//System.out.println(id);
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.clientUpdateSelectProcess(id));
		mav.setViewName("/nononono/clientUpdate");
		return mav;
	}//clientSelectList()

	@RequestMapping("/airinfoUpdate.do")
	public ModelAndView airinfoUpdateSelectList(String flight) {
		//System.out.println(flight);
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.airinfoUpdateSelectProcess(flight));
		mav.setViewName("/nononono/airinfoUpdate");
		return mav;
	}//airinfoUpdateSelectList()
	
	@RequestMapping("/reservationUpdate.do")
	public ModelAndView reservationUpdateSelectList(String rv_num) {
		//System.out.println(flight);
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.reservationUpdateSelectProcess(rv_num));
		mav.setViewName("/nononono/reservationUpdate");
		return mav;
	}//reservationUpdateSelectList()
	
}//end class
