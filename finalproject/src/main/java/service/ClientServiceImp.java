package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ResponseBody;

import dao.ClientDAO;
import dto.ClientDTO;

public class ClientServiceImp implements ClientService{
	private ClientDAO dao;
	
	public ClientServiceImp() {
	
	}
	
	public void setDao(ClientDAO dao) {
		this.dao = dao;
	}

	@Override
	public void insertProcess(ClientDTO dto) {
		dao.insertMethod(dto);
	}

	@Override
	public ClientDTO loginCheck(ClientDTO dto, HttpSession session) {
		ClientDTO result = dao.loginCheck(dto);
		if (result != null) {
			session.setAttribute("id", result.getId());
		}
		return result;
	}

	@Override
	public ClientDTO viewMember(ClientDTO dto) {
		return dao.viewMember(dto);
	}

	@Override
	public int idCheck(String id) {
		return dao.idcheck(id);
	}

	@Override
	public String findId(ClientDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

/*	@Override
	public @ResponseBody String findId(ClientDTO dto) {
		List<ClientDTO> list = dao.findId(dto);
		for(int i=0; i<list.size(); i++) {
			String email = list.get(i).getEmail();
			list.add(dto);
		}
		return email;
	}*/



	
}
