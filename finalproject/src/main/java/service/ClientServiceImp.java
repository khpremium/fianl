package service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	@Override
	public String find_id(String email) throws IOException {
		
		String id = dao.find_id(email);
		if(id == null) {
			return "";
		}else {
			return id;
		}
	}

	 public String find_pw(HttpServletResponse resp, ClientDTO dto) throws IOException {
	      
	      resp.setContentType("text/html;charset=utf-8");
	      PrintWriter out = resp.getWriter();

	      String pw = "";
	      String email = dto.getEmail();
	      
	      if(dao.idcheck(dto.getId()) == 0) {
	         out.print("<script>");
	         out.print("alert('아이디가 없습니다'); history.go(-1);");
	         out.print("</script>");
	         out.flush();
	         out.close();
	      } else if(dao.emailCheck(email) == 0) {
	         out.print("<script>");
	         out.print("alert('이메일이 일치하지 않습니다.'); history.go(-1);");
	         out.print("</script>");
	         out.flush();
	         out.close();
	      }else {
	         
	         for(int i=0; i<12; i++) {
	            pw += (char)((Math.random() *26) + 97);
	         }
	         dto.setPass(pw);
	         dao.update_pw(dto);
	         out.print("<script>");
	         out.println("alert('이메일로 임시비번 발송완료'); history.go(-1)");
	         out.print("</script>");
	         out.flush();
	         out.close();
	   
	         return pw;
	   }
	      return pw;   
	}

	@Override
	public String naverLogin(String email) {
		String id = dao.naverLogin(email);
		return id;
	}


}