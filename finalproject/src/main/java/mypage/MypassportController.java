package mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView passportList(HttpServletRequest req,String rv_code) {
		ModelAndView mav= new ModelAndView();
		HttpSession session =req.getSession();
		
		mav.addObject("passport",service.passportProcess("cd6fcc40"));
		mav.addObject("pass_rvcode","cd6fcc40");
		mav.addObject("alreadypass",service.passportSrcProcess("cd6fcc40"));
		mav.setViewName("mypage/myPassport");
		return mav;
	}
	
	@RequestMapping(value="inspassport.do",method=RequestMethod.POST)
	public String passInsert(PassportInsDTO pdto) {
				
			
			service.passportinsProcess(pdto.getaList());
		
		return "redirect:/passport.do";
	}
	
	
	
}//class


