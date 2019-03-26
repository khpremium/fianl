package mypage;

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
	public ModelAndView profileList(HttpSession session) {
		ModelAndView mav= new ModelAndView();
		
		if(session.getAttribute("id")==null) {
			mav.setViewName("redirect:/login.do");
		}else {		
			mav.addObject("myprofile",service.profileProcess((String)session.getAttribute("id")));
			mav.setViewName("/mypage/myprofile");
		}
		/*mav.addObject("myprofile",service.profileProcess("test01"));
		mav.setViewName("/mypage/myprofile");*/
		return mav;
	}
	
}
