package mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

//http://localhost:8090/myfinal/reschk.do

@Controller
public class MyReservationController {
	private ReservationService service;
	private MypassportService service4;	
	private List<ReservationDTO> aList;
	private int non_person;
	private List<MypassportDTO> non_passsrc;
	private String reservation_rv_code;
	
	
	public MyReservationController() {
		// TODO Auto-generated constructor stub
	}
	
	
	public void setService(ReservationService service) {
		this.service = service;
	}
	
	public void setService4(MypassportService service4) {
		this.service4 = service4;
	}

	@RequestMapping("resok.do")
	public @ResponseBody String myresList(ReservationDTO rdto,PassportInsDTO pdto,HttpServletRequest request) {
		
		System.out.println("통신성공?ㅇㅇ");
		System.out.println(rdto.getRv_code());
		
		aList=service.reschkProcess(rdto);
		System.out.println(service4.passportProcess(rdto.getRv_code()));
		non_person=service4.passportProcess(rdto.getRv_code());
		System.out.println(service4.passportSrcProcess(rdto.getRv_code()));
		non_passsrc=service4.passportSrcProcess(rdto.getRv_code());
		System.out.println(aList);	
		return "sususus";
	}
	
	@RequestMapping("rescheckok.do")
	public ModelAndView reschkeckok() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("myreschk",aList);
		mav.addObject("non_person",non_person);
		mav.addObject("non_passsrc", non_passsrc);
		mav.setViewName("mypage/mypageMain");
		
		return mav;
	}
	
	@RequestMapping(value="non_inspassport.do",method=RequestMethod.POST)
	public String passInsert(PassportInsDTO pdto) {
		/*service4.passportinsProcess(pdto.getaList());*/
		return "redirect:/profile.do";
	}
	
	

	@RequestMapping(value = "/non_reservation_delete.do", method = RequestMethod.POST)
	public String deleteResrvation(String cancel) {
		/*service.resdelProcess(cancel);*/
		return "redirect:/myreservation.do";
	}

	@RequestMapping("reschk.do")
	public ModelAndView rechkpage() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("view/resCheck");
		return mav;
	}


}// class
