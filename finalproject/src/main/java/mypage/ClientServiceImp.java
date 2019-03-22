package mypage;

public class ClientServiceImp implements ClientService {
	private ClientDAO cdao;
	
	public ClientServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setCdao(ClientDAO cdao) {
		this.cdao = cdao;
	}

	@Override
	public ClientDTO profileProcess(String user_id) {
		// TODO Auto-generated method stub
		return cdao.profile(user_id);
	}

	
}
