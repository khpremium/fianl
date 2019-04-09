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
	private ClientService service;
	
	public void setService(ClientService service) {
		this.service = service;
	}
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}
	
	//이메일 인증코드 발생
	@RequestMapping(value = "/emailSend.do", method = RequestMethod.POST)
	public @ResponseBody String SendEmail(ClientDTO dto, HttpServletResponse response, String receiver) throws MessagingException, IOException {

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

	//비밀번호 찾기
	@RequestMapping(value="/find_pw.do", method=RequestMethod.POST)
	public void find_pw(@ModelAttribute ClientDTO dto, HttpServletResponse resp) throws IOException {
		String pw = service.find_pw(resp, dto);
		mailService.send("임시 비밀번호입니다.", pw, "yooeun2810@gmail.com", dto.getEmail(), null);
	}
}