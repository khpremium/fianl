package service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.scheduling.annotation.Async;

import dto.ClientDTO;

public interface MailService {
	
	@Async
	public void send(String subject, String text, String from, String to, String filePath);
	
	
}
