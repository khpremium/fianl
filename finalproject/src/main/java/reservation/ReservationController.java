package reservation;

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
	
	@RequestMapping("selectFlight.do")
	public ModelAndView selectFlight(AirinfoDTO dto) {
		ModelAndView mav = new ModelAndView();
		// mav.addObject("list", service.searchAirinfoProcess(dto));
		mav.setViewName("/reservation/select");
		return mav;
	}

}
