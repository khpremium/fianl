package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.ClientDTO;

public interface ClientService {
	public void insertProcess(ClientDTO dto);
	//회원 로그인 체크 
	public ClientDTO loginCheck(ClientDTO dto, HttpSession session);
	//회원 로그인 정보
	public ClientDTO viewMember(ClientDTO dto);

	public int idCheck(String id);
	
	public String findId(ClientDTO dto); 
	
}
