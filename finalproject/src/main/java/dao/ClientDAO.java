package dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import dto.ClientDTO;

public interface ClientDAO {
	//회원 정보 삽입
	public void insertMethod(ClientDTO dto);
	//회원 로그인 체크
	public ClientDTO loginCheck(ClientDTO dto);
	//회원 로그인 정보
	public ClientDTO viewMember(ClientDTO dto);
	//아이디찾기 이메일체크
	public int emailCheck(String email);
	//회원 아이디 체크
	public int idcheck(String id);
	//회원 아이디 찾기
	public String find_id(String email);
	//회원 비밀번호 찾기(임시 비밀번호)
	public int update_pw(ClientDTO dto);
	//네이버 로그인
	public String naverLogin(String email);
}
