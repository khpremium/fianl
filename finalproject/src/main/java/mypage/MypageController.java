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
	private ReservationService service3;
	private MypassportService service4;	
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
	
	public void setService3(ReservationService service3) {
		this.service3 = service3;
	}
	
	public void setService4(MypassportService service4) {
		this.service4 = service4;
	}
	
	@RequestMapping("profile.do")
	public ModelAndView profileList(HttpServletRequest req,PagingDTO pv) {
		ModelAndView mav= new ModelAndView();
		pv.setUser_id("test00");
		int totalRecord = service2.countProcess(pv);
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PagingDTO(currentPage, totalRecord);
			mav.addObject("pv",pdto);
			pdto.setUser_id("test00");
			mav.addObject("myblist",service2.mylistProcess(pdto));
		}	
		
		mav.addObject("myprofile",service.profileProcess("test00"));
		mav.addObject("myres",service3.reservationProcess("test01"));
		mav.addObject("passport",service4.passportProcess("220545eb"));
		mav.addObject("pass_rvcode","220545eb");
		mav.addObject("alreadypass",service4.passportSrcProcess("220545eb"));
		
		mav.setViewName("view/NewMyPage");
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
		
	
	@RequestMapping(value="/reservation_delete.do",method=RequestMethod.POST)
	public String deleteResrvation(String cancel) {
		service3.resdelProcess(cancel);
		return "redirect:/profle.do";
	}
	
	@RequestMapping(value="inspassport.do",method=RequestMethod.POST)
	public String passInsert(PassportInsDTO pdto) {
				
			
			service4.passportinsProcess(pdto.getaList());
		
		return "redirect:/profile.do";
	}
	
	
	
}//end class