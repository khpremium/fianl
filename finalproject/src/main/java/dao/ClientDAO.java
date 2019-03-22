package dao;

import java.util.List;

import dto.ClientDTO;

public interface ClientDAO {
	public void insertMethod(ClientDTO dto);
	//회원 로그인 체크
	public ClientDTO loginCheck(ClientDTO dto);
	//회원 로그인 정보
	public ClientDTO viewMember(ClientDTO dto);
	
	public int emailCheck(String email);
	
	public int idcheck(String id);
	
	public List<ClientDTO> findId(ClientDTO dto);
}
