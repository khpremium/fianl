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

import dto.ClientDTO;

//http://localhost:8090/myfinal/reschk.do

@Controller
public class MyReservationController {
	private ReservationService service;
	private MypassportService service4;
	
	public MyReservationController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setService(ReservationService service) {
		this.service = service;
	}
	
	public void setService4(MypassportService service4) {
		this.service4 = service4;
	}

	@RequestMapping(value="resok.do",produces="application/text;charset=utf8")
	public @ResponseBody String myresList(ReservationDTO rdto,PassportInsDTO pdto,HttpServletRequest request,HttpSession session) {
		
		System.out.println("통신성공?ㅇㅇ");
		System.out.println(rdto.getRv_code());
		
		if(!service.reservationcheckPro(rdto, session).isEmpty()) {
			return "예약 내역 확인페이지로 이동합니다.";
		} else {
			return "예약번호가 존재하지 않습니다.";
		}
	}
	
	@RequestMapping("rescheckok.do")
	public ModelAndView reschkeckok(ReservationDTO rdto) {
		ModelAndView mav = new ModelAndView();
		System.out.println(rdto.getRv_code());
		System.out.println(rdto.getNon_pass());
		List<ReservationDTO> aList=service.reschkProcess(rdto);
		
		int non_person=service4.passportProcess(rdto.getRv_code());
		List<MypassportDTO> non_passsrc=service4.passportSrcProcess(rdto.getRv_code());
		
		String non_pass_rvcode=rdto.getRv_code();
		
		mav.addObject("myreschk",aList);
		mav.addObject("non_person",non_person);
		mav.addObject("non_passsrc", non_passsrc);
		mav.addObject("non_rvcode", non_pass_rvcode);
		mav.addObject("non_pass",rdto.getNon_pass());
		mav.setViewName("view/non_reservationcheck");
		
		return mav;
	}
	
	@RequestMapping(value="non_inspassport.do",method=RequestMethod.POST)
	public ModelAndView passInsert(PassportInsDTO pdto) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("rv_code",pdto.getaList().get(0).getReservation_rv_code());
		mav.addObject("non_pass",pdto.getaList().get(0).getNon_pass());
		mav.setViewName("redirect:/rescheckok.do#post");
		service4.passportinsProcess(pdto.getaList());
		return mav;
	}
	
	

	@RequestMapping(value = "/non_reservation_delete.do", method = RequestMethod.POST)
	public String deleteResrvation(String non_cancel) {
		service.resdelProcess(non_cancel);
		return "redirect:/reschk.do";
	}

	@RequestMapping("reschk.do")
	public ModelAndView rechkpage() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("view/non_resCheck");
		return mav;
	}

	
	
}// class
