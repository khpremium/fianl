package service;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service("sendEmail")
public class SendEmail {

	private int emailcode = (int) (Math.random() * 900001 + 99999); // 6자리 난수 발생

	private class MyAuthenticator extends Authenticator {
		private String id;
		private String pwd;

		public MyAuthenticator(String id, String pwd) {
			this.id = id;
			this.pwd = pwd;
		}

		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
			return new javax.mail.PasswordAuthentication(id, pwd);
		}
	}

	// 메일을 보내기 위한 gmail 아이디와 비밀번호
	private static String adminId = "yooeun2810@gmail.com";
	private static String adminPwd = "WLALS1013";
	private static Properties p = System.getProperties();
	private MimeMessage msg = null;
	static {
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		p.put("mail.smtp.port", "587"); // gmail 포트
	}

	public SendEmail() {
		Session session = Session.getDefaultInstance(p, new MyAuthenticator(adminId, adminPwd));
		msg = new MimeMessage(session);
	}

	public int sendMail(String receiver) throws MessagingException, UnsupportedEncodingException {
		try {
			String sender = "yooeun2810@gmail.com";
			String subject = "kh 인증코드입니다.";
			String content = "인증번호는 [ " + emailcode + " ] 입니다.";

			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress(sender);
			msg.setFrom(from); // 보내는 사람
			InternetAddress to = new InternetAddress(receiver); //
			InternetAddress[] toList = { to };
			msg.setRecipients(Message.RecipientType.TO, toList);
			msg.setSubject(subject, "UTF-8"); //
			msg.setContent(content, "text/html;charset=UTF-8");
			javax.mail.Transport.send(msg);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
