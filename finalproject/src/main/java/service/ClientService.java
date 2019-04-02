package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.ClientDTO;

public interface ClientService {
	public void insertProcess(ClientDTO dto);
	//회원 로그인 체크 
	public ClientDTO loginCheck(ClientDTO dto, HttpSession session);
	//회원 로그인 정보
	public ClientDTO viewMember(ClientDTO dto);

	public int idCheck(String id);
	
	public int emailCheck(String email);
	
	public String find_id(String email) throws IOException;
	
	public String find_pw(HttpServletResponse resp, ClientDTO dto) throws IOException;
	
	public String naverLogin(String email, HttpSession session);
}
