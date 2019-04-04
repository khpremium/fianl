package mypage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//http://localhost:8090/myfinal/myreservation.do

@Controller
public class MyReservationController {
	private ReservationService service;
	
	public MyReservationController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ReservationService service) {
		this.service = service;
	}
	
	/*
	 * @RequestMapping("myreservation.do") public ModelAndView myresList(String
	 * user_id, HttpSession session) { ModelAndView mav=new ModelAndView();
	 * 
	 * System.out.println(service.reservationProcess("test01"));
	 * mav.addObject("myres",service.reservationProcess("test01"));
	 * mav.setViewName("mypage/myreservation");
	 * 
	 * return mav; }
	 * 
	 * @RequestMapping(value="/reservation_delete.do",method=RequestMethod.POST)
	 * public String deleteResrvation(String cancel) {
	 * service.resdelProcess(cancel); return "redirect:/myreservation.do"; }
	 */
	/*
	@RequestMapping("myreservation.do")
	public ModelAndView myresList(String user_id, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		System.out.println(service.reservationProcess("test01"));
		mav.addObject("myres",service.reservationProcess("test01"));
		mav.setViewName("view/NewMyPage");
		
		return mav;
	}
	
	@RequestMapping(value="/reservation_delete.do",method=RequestMethod.POST)
	public String deleteResrvation(String cancel) {
		service.resdelProcess(cancel);
		return "redirect:/myreservation.do";
	}*/
	
	
	
}// class
