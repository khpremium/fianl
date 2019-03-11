package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.BoardDTO;
import dto.ReplyDTO;
import service.HelpCService;
import service.HelpCServiceImp;

//http://localhost:8090/myfinal/helpMain.do

@Controller
public class HelpCController {
	private HelpCService service;
	
	public HelpCController() {
	}
	
	public void setService(HelpCService service) {
		this.service = service;
	}
	
	@RequestMapping("/helpMain.do")
	public ModelAndView helpMain() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("HList", service.hListProcess());
		mav.setViewName("helpC");
		return mav;
	}
	
	@RequestMapping("/helpBlog.do")
	public ModelAndView helpBlog(int b_num) {
		ModelAndView mav = new ModelAndView();
		BoardDTO bdto = service.hBlogProcess(b_num);
		System.out.println(bdto.getB_num());
		mav.addObject("cList", service.hcomListProcess(b_num));
		mav.addObject("bdto", service.hBlogProcess(b_num));
		mav.setViewName("singleBlog");
		return mav;
	}
	
	@RequestMapping("/comInsertList.do")
	public @ResponseBody List<ReplyDTO> comInsList(ReplyDTO rdto) {
		System.out.println("받음");
		System.out.println(rdto.getBoard_b_num());
		System.out.println(rdto.getCm_content());
		System.out.println(rdto.getUser_id());
		
		
		service.comInsertProcess(rdto);
		System.out.println("ins 완료");
		List<ReplyDTO> rlist = service.hcomListProcess(rdto.getBoard_b_num());
		for ( ReplyDTO rd : rlist) {
			System.out.println(rd.getBoard_b_num());
		}
		return service.hcomListProcess(rdto.getBoard_b_num());
	}
}
