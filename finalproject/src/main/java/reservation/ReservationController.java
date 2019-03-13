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
	public ModelAndView selectFlight(ReservationDTO rdto, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		/*if(guestchk == "noguest") {
			HttpSession session = req.getSession();
			if(session.getAttribute("logOk") == null) {
				session.setAttribute("rtn", "main.do");
				mav.setViewName("redirect:/login.do");
			} else {
				mav.addObject("client_id", session.getAttribute("logOk"));
			}
		}*/
		mav.addObject("dep_date", rdto.getDep_date());
		mav.addObject("arv_date", rdto.getArv_date());
		rdto.setDep_date(rdto.getDep_date().replaceAll("-", ""));
		rdto.setArv_date(rdto.getArv_date().replaceAll("-", ""));
		mav.addObject("dList", service.deptListProcess(rdto));
		mav.addObject("rList", service.returnListProcess(rdto));
		mav.addObject("dep_name", service.cityNameProcess(rdto.getCity_code_dep()));
		mav.addObject("arv_name", service.cityNameProcess(rdto.getCity_code_arv()));
		mav.addObject("rdto", rdto);
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
