package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


//http://localhost:8090/myfinal/passport.do
@Controller
public class MypassportController {
	private MypassportService service;
	private MypassportDAO mypdao;
	
	public MypassportController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(MypassportService service) {
		this.service = service;
	}
	
	@RequestMapping("passport.do")
	public ModelAndView passportList(HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();
		HttpSession session =req.getSession();
		
		mav.addObject("passport",service.passportProcess("023d0d52"));
		mav.setViewName("mypage/myPassport");
		return mav;
	}
	
	
}//class


