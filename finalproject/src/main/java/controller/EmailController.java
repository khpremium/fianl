package controller;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dto.ClientDTO;
import mail.MailUtil;
import service.ClientService;
import service.MailService;
import service.SendEmail;

@Controller
public class EmailController {
	@Resource(name = "SendEmail")
	private SendEmail sm;
	
	private MailService mailService;
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	//이메일 인증코드 발생
	@RequestMapping(value = "/emailSend.do", method = RequestMethod.POST)
	public @ResponseBody String SendEmail(HttpServletResponse response, String receiver) throws MessagingException, IOException {
		
		int emailcode = (int)(Math.random() * 900000 + 100000);
		
		String email_code = String.valueOf(emailcode);
		
		String subject = "회원가입 인증 코드 발급 안내 입니다";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는" + email_code + "입니다");
		
		int start = (int)System.currentTimeMillis();
		
		mailService.send(subject, sb.toString(), "yooeun2810@gmail.com", receiver, null);
		
		int end = (int)System.currentTimeMillis();
		
		System.out.println((end - start) / 1000.0);
		
		return email_code;
		

		//response.getWriter().print(email_code);
	}
	//아이디 찾기
	/*@RequestMapping("/idSearch.do")
	public String SendEmailId(HttpSession session, @RequestParam String email, RedirectAttributes ra) {
		ClientDTO user = service.;
		if(user != null) {
			String subject = "아이디 찾기 안내입니다";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 아이디는 " + user.getId() +  "입니다");
			mailService.send(subject, sb.toString(), "yooeun2810@naver.com", email, null);
			ra.addFlashAttribute("resultMsg", "완료");
		}else {
			ra.addFlashAttribute("resultMsg", "실패");
		}
		return "redirect:/idSearch";
	}*/
}