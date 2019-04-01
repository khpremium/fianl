package mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mypage.PagingDTO;

//http://localhost:8090/myfinal/profile.do

@Controller
public class MypageController {
	
	private ClientService service;
	private PagingDTO pdto;
	private BoardService service2;
	private int currentPage;
	
	public MypageController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ClientService service) {
		this.service = service;
	}
	
	public void setService2(BoardService service2) {
		this.service2 = service2;
	}
	
	@RequestMapping("profile.do")
	public ModelAndView profileList(HttpServletRequest req,PagingDTO pv) {
		ModelAndView mav= new ModelAndView();
		HttpSession session = req.getSession();
		
		/*session.getAttribute("abc");
		if(session.getAttribute("abc")==null) {
			mav.setViewName("redirect:/groot.do");
		}else {		
		mav.addObject("myprofile",service.profileProcess((String)session.getAttribute("abc")));
		mav.setViewName("maypage/mypagemain");
		}*/
		int totalRecord = service2.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PagingDTO(currentPage, totalRecord);
			mav.addObject("pv",pdto);
			mav.addObject("aList",service2.listProcess(pdto));
		}	
		
		mav.addObject("myprofile",service.profileProcess("test00"));
		mav.setViewName("/mypage/myprofile");
		return mav;
	}
	
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public String update(ClientDTO cdto) {
		System.out.println("나오냐?");
		System.out.println(cdto.getPass()+cdto.getEmail()+cdto.getPhonenum()+cdto.getId());
		service.updateMemProcess(cdto);
		System.out.println("이상하네");
		return "redirect:/profile.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(String id) {
		service.deleteMemProcess("test00");
		
		return "redirect:/main.do";
	}
	
	/*@RequestMapping("/list.do")
	public ModelAndView listMethod(PagingDTO pv) {
		ModelAndView mav=new ModelAndView();
		int totalRecord = service2.countProcess();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PagingDTO(currentPage, totalRecord);
			mav.addObject("pv",pdto);
		mav.addObject("aList",service2.listProcess(pv));
		
		
	}
		mav.setViewName("mypage/myprofile");
		return mav;
	}*/
}//end class
