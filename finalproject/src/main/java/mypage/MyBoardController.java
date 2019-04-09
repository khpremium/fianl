package mypage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//http://localhost:8090/myfinal/myboard.do
@Controller
public class MyBoardController {

	private PagingDTO pdto;
	private BoardService service;
	private int currentPage;

	public MyBoardController() {
		// TODO Auto-generated constructor stub
	}

	public void setService(BoardService service) {
		this.service = service;
	}

	/*
	 * @RequestMapping("/myboard.do") public ModelAndView mybList(PagingDTO
	 * pv,HttpSession session) {
	 * 
	 * ModelAndView mav= new ModelAndView(); System.out.println("�릺�깘");
	 * session.getAttribute("test00"); int totalRecord = service.countProcess();
	 * if(totalRecord >=1) { if(pv.getCurrentPage()==0) { currentPage = 1; }else {
	 * currentPage = pv.getCurrentPage(); } pdto = new
	 * PagingDTO(currentPage,totalRecord); mav.addObject("pv",pdto);
	 * mav.addObject("aList",service.listProcess(pdto)); } pv.setUser_id("test00");
	 * mav.addObject("myblist",service.mylistProcess(pv));
	 * mav.setViewName("mypage/myBoard"); return mav; }
	 */

}// class
