package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//http://localhost:8090/myfinal/profile.do

@Controller
public class MypageController {
	
	private ClientService service;
	
	public MypageController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ClientService service) {
		this.service = service;
	}
	
	@RequestMapping("profile.do")
	public ModelAndView profileList(HttpServletRequest req) {
		ModelAndView mav= new ModelAndView();
		HttpSession session = req.getSession();
		
		/*session.getAttribute("abc");
		if(session.getAttribute("abc")==null) {
			mav.setViewName("redirect:/groot.do");
		}else {		
		mav.addObject("myprofile",service.profileProcess((String)session.getAttribute("abc")));
		mav.setViewName("maypage/mypagemain");
		}*/
		mav.addObject("myprofile",service.profileProcess("test01"));
		mav.setViewName("/mypage/mypagemain");
		return mav;
	}
	
}
