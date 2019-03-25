package mypage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


//http://localhost:8090/myfinal/passport.do
@Controller
public class MypassportController {
	private MypassportService service;
	
	public MypassportController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(MypassportService service) {
		this.service = service;
	}
	
	@RequestMapping("passport.do")
	public ModelAndView passportList(HttpSession session, String rv_code) {
		ModelAndView mav= new ModelAndView();
		
		mav.addObject("passport",service.passportProcess("023d0d52"));
		mav.addObject("pass_rvcode","023d0d52");
		mav.setViewName("mypage/myPassport");
		return mav;
	}
	
	@RequestMapping(value="inspassport.do",method=RequestMethod.POST)
	public String passInsert(PassportInsDTO pdto) {
		for(MypassportDTO dto:pdto.getaList()) {
			service.passportinsProcess(dto);
		System.out.println(dto.getReservation_rv_code());
		}
		return "redirect:/passport.do";
	}
	
	
	
}//class


