package reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// http://localhost:8090/myfinal/selectFlight.do

@Controller
public class ReservationController {
	private ReservationService service;
	
	public ReservationController() {
		
	}
	
	public void setService(ReservationService service) {
		this.service = service;
	}
	
	// http://localhost:8090/myfinal/select.do
	@RequestMapping("/select.do")
	public ModelAndView select() {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list", service.searchProcess());
		mav.setViewName("/reservation/guest");
		return mav;
	}
	
	@RequestMapping("/selectFlight.do")
	public ModelAndView selectFlight(ReservationDTO rdto, String guestchk, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		/*if(guestchk == "notguest") {
			HttpSession session = req.getSession();
			if(session.getAttribute("logOk") == null) {
				session.setAttribute("rtn", "selectFlight.do");
				mav.setViewName("redirect:/.do");
			} else {
				mav.addObject("client_id", session.getAttribute("logOk"));
			}
		}*/
		// mav.addObject("dList", service.deptListProcess(rdto));
		// mav.addObject("rList", service.returnListProcess(rdto));
		mav.setViewName("/reservation/select");
		return mav;
	}
	
	@RequestMapping("/guestReservation.do")
	public ModelAndView guestReservation(ReservationDTO rdto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/reservation/guest");
		return mav;
	}
	
	@RequestMapping("/clientReservation.do")
	public ModelAndView clientReservation(ReservationDTO rdto) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/payment.do")
	public ModelAndView paymentMethod(ReservationDTO dto) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
