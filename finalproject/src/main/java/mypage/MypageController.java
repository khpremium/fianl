package mypage;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import mypage.PagingDTO;

//http://localhost:8090/myfinal/profile.do

@Controller
public class MypageController {
	
	private ClientService service;
	private BoardService service2;
	private ReservationService service3;
	private MypassportService service4;	
	private service.BoardService service5;
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
	
	public void setService5(service.BoardService service5) {
		this.service5 = service5;
	}
	
	//http://localhost:8090/myfinal/profile.do
	@RequestMapping("profile.do")
	public ModelAndView profileList(HttpSession session,PagingDTO pv) {
		ModelAndView mav= new ModelAndView();
		String user_id = (String)session.getAttribute("id");
		pv.setUser_id(user_id);
		int totalRecord = service2.countProcess(pv);
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pv = new PagingDTO(currentPage, totalRecord);
			pv.setUser_id(user_id);
			mav.addObject("pv", pv);
			mav.addObject("myblist",service2.mylistProcess(pv));
		}
		List<ReservationDTO> list = service3.reservationProcess(user_id);
		String rv_code;
		if(!list.isEmpty())
			rv_code = list.get(0).getRv_code();
		else
			rv_code = "a";
		
		mav.addObject("myprofile",service.profileProcess(user_id));
		mav.addObject("myres",list);
		mav.addObject("passport",service4.passportProcess(rv_code));
		mav.addObject("pass_rvcode",rv_code);
		mav.addObject("alreadypass",service4.passportSrcProcess(rv_code));
		mav.setViewName("view/NewMyPage");
		return mav;
	}
	
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public String update(ClientDTO cdto) {
		System.out.println(cdto.getPass()+cdto.getEmail()+cdto.getPhonenum()+cdto.getId());
		service.updateMemProcess(cdto);
		return "redirect:/profile.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(String id,PagingDTO pv,HttpSession session,HttpServletRequest request, dto.BoardDTO dto) {
		
		dto.setUser_id(id);
		for(MyBoardDTO bdto : service2.BoardListWho(id)){
			
			dto.setB_num(bdto.getB_num());
			service5.DeleteProcess(dto, request);	
		}	
		service.deleteMemProcess(id);
		session.invalidate();
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
