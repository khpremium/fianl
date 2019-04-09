package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.AirinfoDTO;
import dto.DefaultBoardDTO;
import dto.ClientDTO;
import dto.ReservationDTO;
import service.AdminService;

// http://localhost:8090/myfinal/adminMain.do

@Controller
public class AdminController {
	private AdminService service;

	public AdminController() {
	
	}
	
	public void setService(AdminService service) {
		this.service = service;
	}
	
	@RequestMapping("/adminMain.do")
	public ModelAndView clientSelectList() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("aList",service.clientSelectProcess());
		mav.setViewName("/nononono/adminMain");
		return mav;
	}//clientSelectList()
	
	@RequestMapping("/clientDelete.do")
	public String clientDelete(String id) {
		System.out.println(id);
		service.clientDeleteProcess(id);
		return "redirect:/adminMain.do";
	}
	
	@RequestMapping("/clientChkProcess.do")
	public @ResponseBody int clientProcess(String id) {
		return service.clientChkProcess(id);
	}
	
	@RequestMapping("/clientUpdateForm.do")
	public ModelAndView clientUpdateSelectList(String id) {
		//System.out.println(id);
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.clientUpdateSelectProcess(id));
		mav.setViewName("/nononono/clientUpdate");
		return mav;
	}//clientSelectList()
	
	@RequestMapping(value="/clientUpdate.do", method=RequestMethod.POST)
	public String clientUpdate(ClientDTO dto) {
		service.clientUpdateProcess(dto);
		return "redirect:/adminMain.do";
	}
	
	@RequestMapping(value="/clientInsert.do", method=RequestMethod.POST)
	public String clientInsert(ClientDTO dto) {
		service.clientInsertProcess(dto);
		return "redirect:/adminMain.do";
	}
	
	@RequestMapping("/airTables.do")
	public ModelAndView airInfoSelectList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", service.airInfoSelectProcess());
		mav.addObject("cityList", service.cityListProcess());
		mav.setViewName("/nononono/airTables");
		return mav;
	}
	
	@RequestMapping("/airinfoDelete.do")
	public String airinfoDelete(String flight) {
		System.out.println(flight);
		service.airinfoDeleteProcess(flight);
		return "redirect:/airTables.do";
	}
	
	@RequestMapping("/airinfoChkProcess.do")
	public @ResponseBody int airinfoProcess(String flight) {
		return service.airinfoChkProcess(flight);
	}

	@RequestMapping("/airinfoUpdateForm.do")
	public ModelAndView airinfoUpdateSelectList(String flight) {
		//System.out.println(flight);
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.airinfoUpdateSelectProcess(flight));
		mav.setViewName("/nononono/airinfoUpdate");
		return mav;
	}//airinfoUpdateSelectList()
	
	@RequestMapping(value="/airinfoUpdate.do", method=RequestMethod.POST)
	public String airinfoUpdate(AirinfoDTO dto) {
		service.airinfoUpdateProcess(dto);
		return "redirect:/airTables.do";
	}
	
	@RequestMapping(value="/airinfoInsert.do", method=RequestMethod.POST)
	public String airinfoInsert(AirinfoDTO dto) {
		service.airinfoInsertProcess(dto);
		return "redirect:/airTables.do";
	}
	
	@RequestMapping("/likeReset.do")
	public String likeReset(DefaultBoardDTO dto) {
		service.likeResetProcess(dto);
		service.likeResetDeleteProcess(dto);
	
		return "redirect:/boardTable.do";
	}
	
	@RequestMapping("/boardTable.do")
	public ModelAndView boardTableSelectList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList",service.boardTableSelectProcess());
		mav.setViewName("/nononono/boardTable");
		return mav;
		
	}
	
	@RequestMapping("boardLikeResetPointForm.do")
	public ModelAndView boardLikeResetSelect(String user_id) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",service.boardLikeResetSelect(user_id));
		mav.setViewName("/nononono/boardLikeResetPoint");
		return mav;
	}
	
	@RequestMapping(value="/boardLikeResetPoint.do", method=RequestMethod.POST)
	public String boardLikeResetPoint(ClientDTO dto) {
		service.boardLikeResetPointProcess(dto);
		return "redirect:/boardTable.do";
	}
	
	
	
	/*boardLikeResetPoint*/
	
	@RequestMapping("/resTable.do")
	public ModelAndView reservationInfoSelectList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList",service.reservationSelectProcess());
		mav.addObject("flightList", service.airInfoSelectProcess());
		mav.setViewName("/nononono/resTable");
		return mav;
	}
	
	@RequestMapping("/reservationDelete.do")
	public String reservationDelete(String rv_num) {
		System.out.println(rv_num);
		service.reservationDeleteProcess(rv_num);
		return "redirect:/resTable.do";
	}
	
	@RequestMapping("/reservationUpdateForm.do")
	public ModelAndView reservationUpdateSelectList(String rv_num) {
		//System.out.println(flight);
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto",service.reservationUpdateSelectProcess(rv_num));
		mav.setViewName("/nononono/reservationUpdate");
		return mav;
	}//reservationUpdateSelectList()
	
	@RequestMapping(value="/reservationUpdate.do", method=RequestMethod.POST)
	public String reservationUpdate(ReservationDTO dto) {
		service.reservationUpdateProcess(dto);
		return "redirect:/resTable.do";
	}
	
	@RequestMapping(value="/reservationInsert.do", method=RequestMethod.POST)
	public String reservationInsert(ReservationDTO dto) {
		service.reservationInsertProcess(dto);
		return "redirect:/resTable.do";
	}
	
	
	
}//end class
