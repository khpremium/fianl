package mypage;

import java.util.List;

public class ClientServiceImp implements ClientService {
	private ClientDAO cdao;
	
	public ClientServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setCdao(ClientDAO cdao) {
		this.cdao = cdao;
	}

	@Override
	public ClientDTO profileProcess(String id) {
		// TODO Auto-generated method stub
		return cdao.profile(id);
	}

	
}
