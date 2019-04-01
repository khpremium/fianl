package controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.ClientDTO;
import jdk.nashorn.internal.ir.RuntimeNode.Request;
import mail.MemberManagement;
import service.ClientService;

//http://localhost:8090/myfinal/index.do

@Controller
public class ClientController {
	
private ClientService service;
	
@Resource(name = "memberManagement")
private MemberManagement mm;

	public ClientController() {
		
	}
	
	public void setService(ClientService service) {
		this.service = service;
	}
	
	//메인페이지
	@RequestMapping("/index.do")
	public String main(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	//회원가입 페이지
	@RequestMapping("/join.do")
	public String joinView() {
		return "join";
	}
	
	//로그인 페이지
	@RequestMapping("/login.do")
	public String loginView(String id, String password) {
		return "login";
	}
	
	//로그인 체크
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(ClientDTO dto, HttpSession session) {
		ClientDTO cdto = service.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if(cdto != null) {
			mav.addObject("msg","success");
			mav.setViewName("index");
		} else {
			mav.addObject("msg", "failure");
			mav.setViewName("index");
		}
		return mav;
	}
	
	//네이버로그인 회원가입 이동
	@RequestMapping("/naverJoin.do")
	public String naverLogin(String email, String name, HttpSession session) {
		return "naverJoin";
	}
	
	//아이디 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public @ResponseBody String idCheck(@ModelAttribute("dto") ClientDTO dto, Model model) throws Exception {
		int result = service.idCheck(dto.getId());
		return String.valueOf(result);
	}
	
	//아이디찾기폼 이메일 중복체크
	@RequestMapping(value="/emailCheck.do", method=RequestMethod.POST)
	public @ResponseBody String emailCheck(@ModelAttribute("dto") ClientDTO dto, Model model) {
		int result = service.emailCheck(dto.getEmail());
		return String.valueOf(result);
	}
	
	//로그인 완료 페이지
	@RequestMapping("/index2.do")
	public String loginsuView() {
		return "index";
	}
	
	//회원정보 삽입
	@RequestMapping(value="/joinInsert.do", method=RequestMethod.POST)
	public ModelAndView joinInsert(ClientDTO dto) {
		ModelAndView mav = new ModelAndView();
		String email = dto.getEmail() + "@" + dto.getEmail2();
		dto.setEmail(email);
		service.insertProcess(dto);
		mav.setViewName("joinComplete");
		return mav;
	}
	
	//아이디 찾기 페이지로 간다~
	@RequestMapping("/idSearch.do")
	public String idSearch() {
		return "idSearch";
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping("/passSearch.do")
	public String passSearch() {
		return "passSearch";
	}
	
	//아이디 찾기
	@RequestMapping("/find_id.do")
	public @ResponseBody String findId(HttpServletResponse resp, String email)throws Exception {
		return service.find_id(resp, email);
	}

	//카카오 로그인
	@RequestMapping("/kakaologin.do")
	public String kakaoLogin() {
		return "login2";
	}

}//end class


