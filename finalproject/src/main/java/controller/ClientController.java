package controller;


import java.io.IOException;

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
import mail.MemberManagement;
import service.ClientService;

//http://localhost:8090/myfinal/newIndex.do

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
	/*@RequestMapping("/newIndex.do")
	public String main(HttpSession session) {
		session.invalidate();
		return "/joinMain/newIndex";
	}*/
	
	//회원가입 페이지
	@RequestMapping("/join.do")
	public String joinView() {
		return "/joinMain/join";
	}

	//로그인 체크
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(ClientDTO dto, String path, HttpSession session) {
		ClientDTO cdto = service.loginCheck(dto, session);
		System.out.println(path);
		ModelAndView mav = new ModelAndView();
		if(cdto != null) {
			mav.addObject("msg","success");
			mav.setViewName("redirect:" + path);
		} else {
			mav.addObject("msg", "failure");
			mav.setViewName("redirect:" + path);
		}
		return mav;
	}

	
	//네이버로그인 회원가입 이동
	@RequestMapping("/naverJoin.do")
	public ModelAndView naverLogin(ClientDTO dto, String email, String name, HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();
		ClientDTO cdto = service.loginCheck(dto, session);
		session.setAttribute("email", email);
		
		String aa = service.naverLogin(email);
		
		if(aa != null) {
			if(cdto != null) {
				mav.addObject("msg","success");
				mav.setViewName("redirect:/main.do");
			} else {
				session.setAttribute("id", aa);
				mav.addObject("msg", "failure");
				mav.setViewName("redirect:/main.do");
			}
		}else {
			mav.addObject("email", email);
			mav.addObject("name", name);
			mav.setViewName("/joinMain/naverJoin");
		}	
		return mav;
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

	//회원정보 삽입
	@RequestMapping(value="/joinInsert.do", method=RequestMethod.POST)
	public ModelAndView joinInsert(ClientDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int emailchk = dto.getEmail().indexOf("@");
		if(emailchk == -1) {
			String email = dto.getEmail() + "@" + dto.getEmail2();
			dto.setEmail(email);
		}
		service.insertProcess(dto);
		session.setAttribute("id", dto.getId());
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	//아이디 찾기 페이지로 간다~
	@RequestMapping("/idSearch.do")
	public String idSearch() {
		return "/joinMain/idSearch";
	}
	
	//비밀번호 찾기 페이지
	@RequestMapping("/passSearch.do")
	public String passSearch() {
		return "/joinMain/passSearch";
	}
	
	//아이디 찾기
	@RequestMapping("/find_id.do")
	public @ResponseBody String findId(HttpServletResponse resp, String email)throws Exception {
		return service.find_id(email);
	}

	//카카오 로그인
	@RequestMapping("/kakaologin.do")
	public String kakaoLogin() {
		return "/joinMain/login2";
	}
	
	@RequestMapping("/setSession.do")
	public String se1321321(String seId, HttpSession session) {
		session.setAttribute("id", seId);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}

}//end class