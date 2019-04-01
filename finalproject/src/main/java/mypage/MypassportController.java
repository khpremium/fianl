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
		
		mav.addObject("passport",service.passportProcess("220545eb"));
		mav.addObject("pass_rvcode","220545eb");
		mav.addObject("alreadypass",service.passportSrcProcess("220545eb"));
		mav.setViewName("mypage/myPassport");
		return mav;
	}
	
	@RequestMapping(value="inspassport.do",method=RequestMethod.POST)
	public String passInsert(PassportInsDTO pdto) {
				
			
			service.passportinsProcess(pdto.getaList());
		
		return "redirect:/passport.do";
	}
	
	
	
}//class


