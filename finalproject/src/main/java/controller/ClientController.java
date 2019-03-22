package controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.ClientDAO;
import dao.ClientDaoImp;
import dto.ClientDTO;
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
	public String main() {
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
	
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(ClientDTO dto, HttpSession session) {
		ClientDTO cdto = service.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if(cdto != null) {
			mav.addObject("msg","success");
			mav.setViewName("index2");
		} else {
			mav.addObject("msg", "failure");
			mav.setViewName("login");
		}
		return mav;
	}
	
	/*//이메일 중복체크
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public void emailCheck(HttpServletResponse response, String memberemail) throws IOException {
		int result = 1;
		result = mm.emailCheck(memberemail, result);
		response.getWriter().print(result);
	}*/
	
	//아이디 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public @ResponseBody String idCheck(@ModelAttribute("dto") ClientDTO dto, Model model) throws Exception {
		int result = service.idCheck(dto.getId());
		return String.valueOf(result);
	}
	
	//로그인 완료 페이지
	@RequestMapping("/index2.do")
	public String loginsuView() {
		return "index2";
	}
	
	//회원정보 삽입
	@RequestMapping(value="/joinInsert.do", method=RequestMethod.POST)
	public ModelAndView joinInsert(ClientDTO dto) {
		ModelAndView mav = new ModelAndView();
		service.insertProcess(dto);
		return mav;
	}
	
	//아이디 찾기
	@RequestMapping("/idSearch.do")
	public ModelAndView idSearchForm(ClientDTO dto) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idSearch");
		return mav;
	}
	
	//카카오 로그인
	@RequestMapping("/kakaologin.do")
	public String kakaoLogin() {
		return "login2";
	}
	
}