package mypage;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//http://localhost:8090/myfinal/reschk.do

@Controller
public class MyReservationController {
	private ReservationService service;

	public MyReservationController() {
		// TODO Auto-generated constructor stub
	}

	public void setService(ReservationService service) {
		this.service = service;
	}

	@RequestMapping("reschk.do")
	public ModelAndView myresList(String user_id, HttpSession session,HashMap<String,Object> map) {
		ModelAndView mav = new ModelAndView();
		
		map.put("rv_code", "c093bca2");
		map.put("non_pass", "a1234");
		mav.addObject("myreschk",service.reschkProcess(map));
		mav.setViewName("view/resCheck");
		return mav;
	}
	
	@RequestMapping(value="non_inspassport.do",method=RequestMethod.POST)
	public String passInsert(PassportInsDTO pdto) {
		/*service4.passportinsProcess(pdto.getaList());*/
		return "redirect:/profile.do";
	}
	
	

	@RequestMapping(value = "/non_reservation_delete.do", method = RequestMethod.POST)
	public String deleteResrvation(String cancel) {
		/*service.resdelProcess(cancel);*/
		return "redirect:/myreservation.do";
	}



}// class
